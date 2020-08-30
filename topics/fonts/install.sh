fonts_directory="$HOME/.fonts"

mkdir -p "$fonts_directory"
cd "$fonts_directory"

if ! find . -name 'Fira*' -printf 1 -quit | grep -q 1; then
  url='https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
  wget -O font.zip "$url"
  unzip -o font.zip
  rm font.zip
  find . -iname "Fura*" -delete
  find . -iname "Fira*.ttf" -delete
  find . -iname "Fira*Windows Compatible*" -delete
fi

sudo dnf install google-roboto-fonts

fc-cache -fv "$fonts_directory"
