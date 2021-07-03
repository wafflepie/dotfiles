winexpo() {
  EXPO_TOPIC_PATH=$(wslpath -w "$DOTFILES/topics/expo")

  # NOTE: This is purely to suppress warnings that UNC paths are not supported.
  cd /mnt/c
  cmd.exe /C "pushd $EXPO_TOPIC_PATH && powershell.exe -File portproxy.ps1"
  export REACT_NATIVE_PACKAGER_HOSTNAME=$(powershell.exe -Command "(Get-NetIPAddress -InterfaceAlias Wi-Fi -AddressFamily IPv4).IPAddress")
  cd - > /dev/null
}
