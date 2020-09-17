if command -v wslvar > /dev/null; then
  export WINHOME="$(wslpath "$(wslvar USERPROFILE)")"
fi
