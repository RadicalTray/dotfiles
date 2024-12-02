append_path () { # stolen from /etc/profile
  case ":$PATH:" in
      *:"$1":*)
          ;;
      *)
          PATH="${PATH:+$PATH:}$1"
  esac
}
insert_path () {
  case ":$PATH:" in
      *:"$1":*)
          ;;
      *)
          PATH="$1:$PATH"
  esac
}
insert_path "$HOME/.local/bin"
unset -f append_path insert_path

export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export TERMINAL="/usr/bin/foot"
