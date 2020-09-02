if ! is_wsl; then
  for extension in $(cat extensions.txt); do
    code --install-extension "$extension"
  done
fi
