# NOTE: Uncomment the line below and run `zprof` for profiling
# zmodload zsh/zprof

cd "$(readlink ~/.zshrc | xargs dirname)"
export DOTFILES="$(git rev-parse --show-toplevel)"
cd - > /dev/null

export TERM='xterm-256color'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# NOTE: These options hide the occasional percentage sign at the cost of some newlines.
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# NOTE: Fixes `git reset HEAD^`, see https://github.com/ohmyzsh/ohmyzsh/issues/449#issuecomment-6973326
setopt NO_NOMATCH

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$DOTFILES/binaries:$PATH"
export PATH="./bin:$PATH"

for file in $(
  find "$DOTFILES/topics" -name '*.pre.zsh'
  find "$DOTFILES/topics" -name '*.zsh' ! -name '*.pre.zsh' ! -name '*.post.zsh'
); do
  source "$file"
done

source ~/.zsh_plugins.sh

for file in $(find "$DOTFILES/topics" -name '*.post.zsh'); do
  source "$file"
done
