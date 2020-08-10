fonts_directory="$HOME/.fonts"

mkdir -p "$fonts_directory"

urls=(
  'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
)

cd "$fonts_directory"

for url in "$urls"; do
  wget -q -O font.zip "$url" && unzip -o font.zip && rm font.zip
done

find . -iname "Fura Code*" -delete
find . -iname "*.ttf" -delete
find . -iname "*Windows Compatible*" -delete

sudo dnf install google-roboto-fonts

fc-cache -fv "$fonts_directory"
