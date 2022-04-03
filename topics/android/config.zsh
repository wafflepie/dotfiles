if is_macos; then
  export ANDROID_SDK="$HOME/Library/Android/sdk"
else
  export ANDROID_SDK="$HOME/Android/Sdk"
fi

export PATH="$ANDROID_SDK/platform-tools:$PATH"

winavd() {
  # NOTE: This is purely to suppress warnings that UNC paths are not supported.
  cd /mnt/c
  cmd.exe /C "emulator -avd $@"
  cd - > /dev/null
}

winadb() {
  # NOTE: This is purely to suppress warnings that UNC paths are not supported.
  cd /mnt/c
  cmd.exe /C "adb $@"
  cd - > /dev/null
}
