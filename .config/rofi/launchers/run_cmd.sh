#! /usr/bin/env sh

declare -a cmd_label
declare -a cmd

cmd_label+=("Calculator")
run_calc() {
    rofi -show calc -modi calc -no-show-match -no-sort \
         -calc-command "wl-copy '{result}'" \
         -no-show-icons -hint-welcome "Waiting for input..."
}
cmd+=(run_calc)

cmd_label+=("Capture Desktop")
shotdisplay() {
    hyprshot -m output
}
cmd+=(shotdisplay)

cmd_label+=("Capture Window")
shotwindow() {
    hyprshot -m window
}
cmd+=(shotwindow)

cmd_label+=("Capture Region")
shotregion() {
    hyprshot -m region
}
cmd+=(shotregion)

rofi_cmd() {
    rofi \
        -theme-str "listview {columns: 1; lines: ${#cmd[@]};}" \
        -dmenu \
        -no-show-icons \
        -p "Command:" \
        -i \
        -matching fuzzy
}

run_rofi() {
    printf '%s\n' "${cmd_label[@]}" | rofi_cmd
}

chosen="$(run_rofi)"

for i in "${!cmd_label[@]}"; do
    if [ "$chosen" = "${cmd_label[$i]}" ]; then
        "${cmd[$i]}"
    fi
done
