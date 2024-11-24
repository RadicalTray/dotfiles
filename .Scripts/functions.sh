set-hyprpaper() {
  # No Color
  local nc='\033[0m'
  # Regular
  # local black='\033[0;30m'
  local red='\033[0;31m'
  local green='\033[0;32m'
  # local yellow='\033[0;33m'
  # local blue='\033[0;34m'
  # local purple='\033[0;35m'
  # local cyan='\033[0;36m'
  # local white='\033[0;37m'

  if [[ "$#" -lt 1 ]] || [[ "$#" -gt 2 ]]; then
    echo -e "usage: set-hyprpaper <path> [monitor]" >&2
    return 1
  fi

  local monitor=$2
  if [[ -z "$monitor" ]]; then
    if [[ -z "$MY_MONITOR" ]]; then
      echo -e "${red}MY_MONITOR variable is empty!${nc}" >&2
      echo -e "usage: set-hyprpaper <path> [monitor]" >&2
      return 2
    fi
    monitor=$MY_MONITOR
  fi

  local wallpaper="$(realpath "$1")"

  local preload_ret=$(hyprctl hyprpaper preload "$wallpaper")
  if [[ "$preload_ret" = "ok" ]]; then
    echo -e "${green}Wallpaper preload successful.${nc}"
  else
    echo -e "${red}Wallpaper preload unsuccessful.${nc}"
    echo -e "${red}Error: ${preload_ret}${nc}"
  fi

  local wallpaper_ret=$(hyprctl hyprpaper wallpaper "$monitor,$wallpaper")
  if [[ "$wallpaper_ret" = "ok" ]]; then
    echo -e "${green}Wallpaper is set.${nc}"
  else
    echo -e "${red}Wallpaper set unsuccessful.${nc}"
    echo -e "${red}Error: ${wallpaper_ret}${nc}"
  fi
}

update-neovim-nightly() (
  cd ~/.cache/paru/clone/neovim-nightly-bin
  makepkg -si --needed
)
