if is_wsl; then
  extensions=$(cat extensions.txt)

  # NOTE: This is purely to suppress warnings that UNC paths are not supported.
  cd /mnt/c

  for extension in $extensions; do
    # NOTE: It is still necessary to install some of the extensions in WSL too, but installing
    # them in Windows simplifies the WSL installation, as they will appear in the Extensions tab.
    cmd.exe /C code --install-extension "$extension"
  done

  cd - > /dev/null
fi

if is_mac; then
  for extension in $(cat extensions.txt); do
    code --install-extension "$extension"
  done
fi
