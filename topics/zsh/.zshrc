# NOTE: Uncomment the line below and run `zprof` for profiling
# zmodload zsh/zprof

export DOTFILES="$HOME/.dotfiles"
export EDITOR=code
export TERM='xterm-256color'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$DOTFILES/binaries:$PATH"
export PATH="./bin:$PATH"

for file in $(
  find $DOTFILES/topics -name '*.pre.zsh'
  find $DOTFILES/topics -name '*.zsh' ! -name '*.pre.zsh' ! -name '*.post.zsh'
); do
  source "$file"
done

source ~/.zsh_plugins.sh

for file in $(find $DOTFILES/topics -name '*.post.zsh'); do
  source "$file"
done
