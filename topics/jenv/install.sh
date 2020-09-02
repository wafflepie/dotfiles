if ! is_wsl; then
  if ! [[ -d "$HOME/.jenv" ]]; then
    git clone https://github.com/jenv/jenv.git ~/.jenv
  fi

  source config.zsh

  eval "$(jenv init -)"
  jenv enable-plugin maven
  jenv enable-plugin springboot
fi
