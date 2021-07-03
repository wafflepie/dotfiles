# https://github.com/pypa/pip/issues/7883#issuecomment-852102601
if is_wsl; then
  unset DISPLAY
fi

pip3 install thefuck --user
run_topic_script topics/x/display.zsh
