# NOTE: Uncomment the line below and run `zprof` for profiling
# zmodload zsh/zprof

export DOTFILES=$HOME/.dotfiles
export EDITOR=code
export TERM='xterm-256color'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$DOTFILES/binaries:$PATH"
export PATH="./bin:$PATH"

for file in $DOTFILES/topics/**/*.pre.zsh; do
  [[ -f "$file" ]] || break
  . "$file"
done

for file in $DOTFILES/topics/**/*.zsh; do
  [[ -f "$file" ]] || break
  if [[ "$file" != *.pre.zsh && "$file" != *.post.zsh ]]; then
    . "$file"
  fi
done

. ~/.zsh_plugins.sh

for file in $DOTFILES/topics/**/*.post.zsh; do
  [[ -f "$file" ]] || break
  . "$file"
done
