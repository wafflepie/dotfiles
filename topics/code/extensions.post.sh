extensions=$(cat extensions.txt)

# NOTE: This is purely to suppress warnings that UNC paths are not supported.
if is_wsl; then
  cd "$HOME/winhome"
fi

for extension in $extensions; do
  if is_wsl; then
    cmd.exe /C code --install-extension "$extension"
  else
    code --install-extension "$extension"
  fi
done
