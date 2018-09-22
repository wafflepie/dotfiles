set -gx DOTFILES $HOME/.dotfiles

set -gx PATH /usr/local/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $DOTFILES/binaries $PATH
set -gx PATH ./bin $PATH

set -gx EDITOR code

if test -e ~/.localrc
    source ~/.localrc
end

for file in $DOTFILES/topics/**/*.fish
    source $file
end
