#! /usr/bin/env zsh

prompt='Screenshot'
list_col='1'
list_row='3'

capture_desktop="Capture Desktop"
capture_window="Capture Window"
capture_area="Capture Area"

rofi_cmd() {
    rofi \
        -theme-str "listview {columns: $list_col; lines: $list_row;}" \
        -dmenu \
        -p "$prompt" \
        -markup-rows \
        -i \
        -matching fuzzy
}

run_rofi() {
    echo -e "$capture_desktop\n$capture_window\n$capture_area" | rofi_cmd
}

shotdisplay() {
    hyprshot -m output
}

shotwindow() {
    hyprshot -m window
}

shotregion() {
    hyprshot -m region
}

chosen="$(run_rofi)"

case $chosen in

    $capture_desktop)
        shotdisplay
        ;;

    $capture_window)
        shotwindow
        ;;

    $capture_area)
        shotregion
        ;;

esac
