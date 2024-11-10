append_path () {
  case ":$PATH:" in
      *:"$1":*)
          ;;
      *)
          PATH="${PATH:+$PATH:}$1"
  esac
}
append_path "$HOME/.local/bin"
unset -f append_path

export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL=/usr/bin/foot
eval $(dircolors ~/.Scripts/dircolors)
