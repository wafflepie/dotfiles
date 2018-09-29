for extension in $(cat extensions.txt); do
  code --install-extension "$extension"
done
