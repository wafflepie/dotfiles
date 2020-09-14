if [[ -d "$HOME/.jenv" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"

  eval "$(jenv init - --no-rehash)"
  (jenv rehash &) 2> /dev/null
fi
