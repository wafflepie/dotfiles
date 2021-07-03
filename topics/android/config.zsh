export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
export ANDROID_SDK="$HOME/Android/Sdk"

winavd() {
  # NOTE: This is purely to suppress warnings that UNC paths are not supported.
  cd /mnt/c
  cmd.exe /C "emulator -avd $@"
  cd - > /dev/null
}
