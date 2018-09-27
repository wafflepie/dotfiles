export DOTFILES=$HOME/.dotfiles
export PATH="./bin:$DOTFILES/binaries:/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR=code
export TERM='xterm-256color'

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

. $DOTFILES/topics/zsh/completions.sh
. ~/.zsh_plugins.sh

for file in $DOTFILES/topics/**/*.post.zsh; do
  [[ -f "$file" ]] || break
  . "$file"
done
