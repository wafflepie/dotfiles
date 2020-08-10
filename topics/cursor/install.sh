sudo dnf install inkscape xcursorgen

if [[ ! -d "$HOME/.icons/Bibata_Classic" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/KaizIqbal/Bibata_Cursor/master/Bibata.sh)"
fi
