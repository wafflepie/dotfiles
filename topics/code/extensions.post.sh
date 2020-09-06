extensions=$(cat extensions.txt)

# NOTE: This is purely to suppress warnings that UNC paths are not supported.
if is_wsl; then
  cd /mnt/c
fi

for extension in $extensions; do
  # NOTE: It is still necessary to install some of the extensions in WSL too, but installing
  # them in Windows simplifies the WSL installation, as they will appear in the Extensions tab.
  if is_wsl; then
    cmd.exe /C code --install-extension "$extension"
  else
    code --install-extension "$extension"
  fi
done

if is_wsl; then
  cd - > /dev/null
fi
