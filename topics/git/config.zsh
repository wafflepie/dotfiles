if is_wsl; then
  # https://github.com/microsoft/WSL/issues/5065#issuecomment-820411552
  export WSL_INTEROP="/run/WSL/$(ls -tr /run/WSL | head -n1)"
fi
