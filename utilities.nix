{ pkgs, ... }:

let
  # 1. Keyboard Backlight Controller
  kbdBacklight = pkgs.writeShellScriptBin "kbd-backlight" ''
    device="asus::kbd_backlight"
    direction="''${1:-up}"

    if [[ "$direction" == "off" ]]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -sd "$device" set 0 >/dev/null
      exit 0
    elif [[ "$direction" == "restore" ]]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -rd "$device" >/dev/null
      exit 0
    fi

    max_brightness="$(${pkgs.brightnessctl}/bin/brightnessctl -d "$device" max)"
    current_brightness="$(${pkgs.brightnessctl}/bin/brightnessctl -d "$device" get)"

    step=$(( max_brightness / 10 ))
    (( step < 1 )) && step=1

    if [[ "$direction" == "cycle" ]]; then
      new_brightness=$(( current_brightness + step ))
      (( new_brightness > max_brightness )) && new_brightness=0
    elif [[ "$direction" == "up" ]]; then
      new_brightness=$(( current_brightness + step ))
      (( new_brightness > max_brightness )) && new_brightness=$max_brightness
    else
      new_brightness=$(( current_brightness - step ))
      (( new_brightness < 0 )) && new_brightness=0
    fi

    ${pkgs.brightnessctl}/bin/brightnessctl -d "$device" set "$new_brightness" >/dev/null
    percent=$(( new_brightness * 100 / max_brightness ))
    
    ${pkgs.swayosd}/bin/swayosd-client --custom-message "Keyboard Backlight: $percent%"
  '';

  # 2. Touchpad Toggle
  touchpadToggle = pkgs.writeShellScriptBin "touchpad-toggle" ''
    STATE_CONF="$HOME/.local/state/hypr/touchpad-disabled.conf"
    device="asuf1207:00-2808:0219-touchpad"

    enable() {
      ${pkgs.hyprland}/bin/hyprctl keyword "device[$device]:enabled" true >/dev/null
      rm -f "$STATE_CONF"
      ${pkgs.swayosd}/bin/swayosd-client --custom-icon input-touchpad-symbolic --custom-message "Touchpad Enabled"
    }

    disable() {
      ${pkgs.hyprland}/bin/hyprctl keyword "device[$device]:enabled" false >/dev/null
      mkdir -p "$(dirname "$STATE_CONF")"
      printf 'device {\n    name = %s\n    enabled = false\n}\n' "$device" > "$STATE_CONF"
      ${pkgs.swayosd}/bin/swayosd-client --custom-icon touchpad-disabled-symbolic --custom-message "Touchpad Disabled"
    }

    case "''${1:-toggle}" in
      on) enable ;;
      off) disable ;;
      toggle) if [[ -f "$STATE_CONF" ]]; then enable; else disable; fi ;;
    esac
  '';

  # 3. Audio Output Switcher
  audioOutputSwitch = pkgs.writeShellScriptBin "audio-output-switch" ''
    sinks=$(${pkgs.pulseaudio}/bin/pactl -f json list sinks | ${pkgs.jq}/bin/jq '[.[] | select((.ports | length == 0) or ([.ports[]? | .availability != "not available"] | any))]')
    sinks_count=$(echo "$sinks" | ${pkgs.jq}/bin/jq '. | length')

    if (( sinks_count == 0 )); then
      ${pkgs.swayosd}/bin/swayosd-client --custom-message "No audio devices found"
      exit 1
    fi

    current_sink_name=$(${pkgs.pulseaudio}/bin/pactl get-default-sink)
    current_sink_index=$(echo "$sinks" | ${pkgs.jq}/bin/jq -r --arg name "$current_sink_name" 'map(.name) | index($name)')

    if [[ "$current_sink_index" != "null" ]]; then
      next_sink_index=$(((current_sink_index + 1) % sinks_count))
    else
      next_sink_index=0
    fi

    next_sink=$(echo "$sinks" | ${pkgs.jq}/bin/jq -r ".[$next_sink_index]")
    next_sink_name=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.name')

    next_sink_description=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.description')
    if [[ "$next_sink_description" == "(null)" ]] || [[ "$next_sink_description" == "null" ]] || [[ -z "$next_sink_description" ]]; then
      device_id=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.properties."device.id"')
      if [[ "$device_id" != "null" ]] && [[ -n "$device_id" ]]; then
        next_sink_description=$(${pkgs.wireplumber}/bin/wpctl status | grep -E "^\s*│?\s+''${device_id}\." | sed -E 's/^.*[0-9]+\.\s+//' | sed -E 's/\s+\[.*$//')
      fi
      if [[ -z "$next_sink_description" ]]; then
        sink_id=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.properties."object.id"')
        next_sink_description=$(${pkgs.wireplumber}/bin/wpctl status | grep -E "\s+\*?\s+''${sink_id}\." | sed -E 's/^.*[0-9]+\.\s+//' | sed -E 's/\s+\[.*$//')
      fi
    fi

    next_sink_volume=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.volume | to_entries[0].value.value_percent | sub("%"; "")')
    next_sink_is_muted=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.mute')

    if [[ "$next_sink_is_muted" == "true" ]] || (( next_sink_volume == 0 )); then
      icon_state="muted"
    elif (( next_sink_volume <= 33 )); then
      icon_state="low"
    elif (( next_sink_volume <= 66 )); then
      icon_state="medium"
    else
      icon_state="high"
    fi

    next_sink_volume_icon="sink-volume-''${icon_state}-symbolic"

    if [[ "$next_sink_name" != "$current_sink_name" ]]; then
      next_sink_wpid=$(echo "$next_sink" | ${pkgs.jq}/bin/jq -r '.properties."object.id"')
      ${pkgs.wireplumber}/bin/wpctl set-default "$next_sink_wpid"
    fi

    ${pkgs.swayosd}/bin/swayosd-client \
      --custom-message "$next_sink_description" \
      --custom-icon "$next_sink_volume_icon"
  '';

  # 4. Display Mirror Switcher
  displayMirror = pkgs.writeShellScriptBin "display-mirror" ''
    TOGGLE_FLAG="$HOME/.local/state/hypr/internal-monitor-mirror.conf"

    INTERNAL=$(${pkgs.hyprland}/bin/hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[] | select(.name | contains("eDP")).name' | head -n 1)
    EXTERNAL=$(${pkgs.hyprland}/bin/hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[] | select(.name | contains("eDP") | not).name' | head -n 1)

    enable() {
      if [[ -z "$EXTERNAL" ]]; then
        ${pkgs.libnotify}/bin/notify-send -u low "󰍹    No external monitors found for mirror"
        exit 1
      fi
      if [[ -z "$INTERNAL" ]]; then
        ${pkgs.libnotify}/bin/notify-send -u low "󰍹    No laptop monitor found to mirror"
        exit 1
      fi

      mkdir -p "$(dirname "$TOGGLE_FLAG")"
      echo "monitor=$EXTERNAL, preferred, auto, 1, mirror, $INTERNAL" > "$TOGGLE_FLAG"
      ${pkgs.libnotify}/bin/notify-send -u low "󰍹    Mirroring enabled ($EXTERNAL)"
      ${pkgs.hyprland}/bin/hyprctl reload
    }

    disable() {
      if [[ -f "$TOGGLE_FLAG" ]]; then
        rm -f "$TOGGLE_FLAG"
        ${pkgs.libnotify}/bin/notify-send -u low "󰍹    Extended mode restored"
        ${pkgs.hyprland}/bin/hyprctl reload
      fi
    }

    case "$1" in
      on) enable ;;
      off) disable ;;
      toggle) if [[ -f "$TOGGLE_FLAG" ]]; then disable; else enable; fi ;;
      *) echo "Usage: display-mirror {on|off|toggle}" >&2; exit 1 ;;
    esac
  '';
in {
  home.packages = [
    # Required dependencies
    pkgs.swayosd
    pkgs.brightnessctl
    pkgs.wireplumber
    pkgs.playerctl
    pkgs.jq
    pkgs.pulseaudio
    pkgs.libnotify

    # Our custom helper packages
    kbdBacklight
    touchpadToggle
    audioOutputSwitch
    displayMirror
  ];
}
