link_file() {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then
        skip=true
      else

        echo "File already exists: $dst ($(basename "$src")), what do you want to do?"
        echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

        read -n 1 action

        case "$action" in
        o)
          overwrite=true
          ;;
        O)
          overwrite_all=true
          ;;
        b)
          backup=true
          ;;
        B)
          backup_all=true
          ;;
        s)
          skip=true
          ;;
        S)
          skip_all=true
          ;;
        *) ;;

        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      echo "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      echo "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      echo "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then # "false" or empty
    parent=$(dirname "$2")
    if [ ! -d "$parent" ]; then
      mkdir -p "$parent"
    fi

    ln -s "$1" "$2"
    echo "linked $1 to $2"
  fi
}

install_dotfiles() {
  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' -not -path '*.git*'); do
    dst=$(basename "${src%.*}")
    dst="$HOME/.${dst//+//}"
    link_file "$src" "$dst"
  done
}

install_dotfiles
