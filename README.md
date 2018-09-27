# wafflepie/dotfiles

Welcome to my dotfiles! Here are some points to help you decide if they are suitable for you. Do you...

- ...want a beautiful terminal?
- ...need sane macOS defaults optimized for developers?
- ...desire useful binaries, tools, presets and aliases?
- ...crave automatic setup of `brew`, `git`, `nvm`, `jenv`, symlinks and more?
- ...demand effortless maintenance?
- ...wish to have an easy way of adding more config files and tools?

Then you've come to the right place!

**WARNING:** My dotfiles contain a lot of stuff, most of which you probably don't need. Instead of using my repository directly, you should do a couple of things:

- Create a fork.
- Review the code. Seriously. You've been warned.
- Remove anything you do not want. Here's a couple of suggestions:
  - Open `topics/brew/Brewfile` and remove any packages you do not want.
  - Remove any topics you do not need. If you don't use Visual Studio Code, remove the entire `topics/code` directory

## Installation

These dotfiles are supposed to work on a clean installation of macOS. If they don't, open an issue and I'll look into it. Thanks!

```sh
# Replace `wafflepie` with your GitHub username
git clone --recurse-submodules https://github.com/wafflepie/dotfiles.git ~/.dotfiles
~/.dotfiles/init.sh
```

And you're done! Once installed, you can reinitialize from any directory by running `dot`.

The `dot` binary also includes some additional features for maintenance. Run `dot -h` or review the source code in `/binaries/dot` for more info.

## Structure

The structure is built around topics, see [holman's dotfiles](https://github.com/holman/dotfiles) to learn more about this approach.

```
.dotfiles/
├── binaries      # Useful binaries, explore them!
├── scripts       # (Re)initialization scripts, also runnable by themselves
├── submodules    # Various submodules, I use them as sources for symlinks
└── topics        # Config files and install scripts organized by topics
```

Any file in `/topics` beginning with a dot (such as `/topics/git/.gitconfig`) will be automagically symlinked to your home directory. Use the `+` character to indicate a directory structure. For example, `/topics/git/.git-templates+hooks+post-commit` will be symlinked to `~/.git-templates/hooks/post-commit`

You can add an `install.sh` script to a topic if you need some additional setup upon (re)initialization. You can also name it `install.pre.sh` or `install.post.sh` if you need them to run in some special order.

Any `.zsh` files in `/topics` will be automatically sourced in the `.zshrc` file. As with the install scripts, you can use the `.pre.zsh` and `.post.zsh` suffixes to modify the order. The `.post.zsh` files will be loaded AFTER all of the antibody plugins.

## Maintenance

Just run `dot` and you're good to go. This will reinitialize your dotfiles, i.e. recreate symlinks and run all install scripts. Running `dot` SHOULD be idemponent, so you can reinitialize as many times as you need to.
