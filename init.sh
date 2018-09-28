#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

link_file() {
  local src="$1" dst="$2"

  local overwrite= backup= skip=
  local action=

  if [[ -f "$dst" ]] || [[ -d "$dst" ]] || [[ -L "$dst" ]]; then
    if [[ "$overwrite_all" == "" ]] && [[ "$backup_all" == "" ]] && [[ "$skip_all" == "" ]]; then
      local current_src="$(readlink $dst)"

      if [[ "$current_src" == "$src" ]]; then
        skip=true
      else
        echo "File already exists: $dst ($(basename "$src")), what do you want to do?"
        echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

        read -n 1 action

        echo ""

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
          *)
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [[ "$overwrite" == "true" ]]; then
      rm -rf "$dst"
      echo "removed $dst"
    fi

    if [[ "$backup" == "true" ]]; then
      mv "$dst" "${dst}.backup"
      echo "moved $dst to ${dst}.backup"
    fi

    if [[ "$skip" == "true" ]]; then
      echo "skipped $src"
    fi
  fi

  if [[ "$skip" != "true" ]]; then
    parent=$(dirname "$2")
    if [[ ! -d "$parent" ]]; then
      mkdir -p "$parent"
    fi

    ln -s "$1" "$2"

    echo "linked $1 to $2"
  fi
}

link_all_files() {
  local overwrite_all= backup_all= skip_all=

  for src in $(
    find "$DOTFILES/topics" -name '.*' |
    grep -v '.DS_Store' |
    grep -v '.gitignore'
  ); do
    dst=$(basename $src | sed 's/+/\//g')
    dst="$HOME/$dst"
    link_file "$src" "$dst"
  done
}

link_all_files
link_file "$DOTFILES/.gitignore" "$HOME/.gitignore"

for script in $(
  find topics -name '*.pre.sh'
  find topics -name '*.sh' ! -name '*.pre.sh' ! -name '*.post.sh'
  find topics -name '*.post.sh'
); do
  echo "> $script"
  source "$script"
done

echo "dotfiles successfully set up"
