#!/bin/zsh

# Build the mapping entries with comments above each line
MAPPINGS=(
    # F7 -> Previous Track
    '{"HIDKeyboardModifierMappingSrc": 0x700000040, "HIDKeyboardModifierMappingDst": 0x0C000000B6}'

    # F8 -> Play / Pause
    '{"HIDKeyboardModifierMappingSrc": 0x700000041, "HIDKeyboardModifierMappingDst": 0x0C000000CD}'

    # F9 -> Next Track
    '{"HIDKeyboardModifierMappingSrc": 0x700000042, "HIDKeyboardModifierMappingDst": 0x0C000000B5}'

    # F10 -> Mute
    '{"HIDKeyboardModifierMappingSrc": 0x700000043, "HIDKeyboardModifierMappingDst": 0x0C000000E2}'

    # F11 -> Volume Down
    '{"HIDKeyboardModifierMappingSrc": 0x700000044, "HIDKeyboardModifierMappingDst": 0x0C000000EA}'

    # F12 -> Volume Up
    '{"HIDKeyboardModifierMappingSrc": 0x700000045, "HIDKeyboardModifierMappingDst": 0x0C000000E9}'
)

# Join array items with commas and wrap in UserKeyMapping JSON
PAYLOAD=$(printf ",%s" "${MAPPINGS[@]}")
PAYLOAD="{\"UserKeyMapping\":[${PAYLOAD:1}]}"

# Apply keybindings to macOS HID system
/usr/bin/hidutil property --set "$PAYLOAD"