if ! is_wsl && is_fedora; then
  export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
  export ANDROID_SDK="$HOME/Android/Sdk"
fi
