fonts_directory="$HOME/.fonts"

rm -rf "$fonts_directory"
mkdir -p "$fonts_directory"

urls=(
  'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
)

cd "$fonts_directory"

for url in "$urls"; do
  wget -q -O font.zip "$url" && unzip font.zip && rm font.zip
done

fc-cache -fv "$fonts_directory"
