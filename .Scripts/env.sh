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
if command -v luarocks 2>&1 >/dev/null; then
    if [[ -v $XDG_CONFIG_HOME ]]; then
        export LUAROCKS_CONFIG="$XDG_CONFIG_HOME/luarocks/config.lua"
    else
        export LUAROCKS_CONFIG="$HOME/.config/luarocks/config.lua"
    fi
    eval "$(luarocks path --no-bin)"
fi
