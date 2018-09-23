# wafflepie/dotfiles

Welcome to my dotfiles! Here are some extremely persuasive points to help you decide if they are suitable for you. Do you...

- ...want to have a beautiful terminal?
- ...need sane macOS defaults which are optimized for developers?
- ...desire many useful binaries, tools, presets and aliases?
- ...crave automatic setup of `brew`, `git`, `nvm`, `jenv`, symlinks and more?
- ...demand effortless maintenance via the `dot` binary?
- ...wish to have an easy way to add additional config files and tools?
- ...like fish?

Delightful! Then just download the dotfiles and run them with elevated permi--

Hang on. I know that you're eager to have everything up and running ASAP, but do not just blindly clone this repository. First of all, there's a lot of stuff in here. Second of all, you don't know me. Don't just run something that you randomly found on the internet, geez.

Instead, here's what you should do:

- Create a fork
- Review the code (seriously)
- Remove stuff you do not want. A good starting point is `topics/brew/Brewfile`.

## Installation

These dotfiles are supposed to work on a clean installation of macOS. If they don't, open an issue or create a PR and I'll look into it, thanks!

```sh
git clone --recurse-submodules https://github.com/wafflepie/dotfiles.git ~/.dotfiles
~/.dotfiles/init.sh
```

And you're done! Once installed, you can reinitialize from any directory by running `dot`.

The `dot` binary also includes some additional features for maintenance. Run `dot -h` or review the source code (`/binaries/dot`) to for more info.

## Structure

The structure is built around topics, see [holman's dotfiles](https://github.com/holman/dotfiles) to learn more about this approach.

```
.dotfiles/
├── binaries      # Useful binaries, explore them!
├── functions     # Aliases and fish functions, symlinked to `.config/fish`
├── scripts       # (Re)initialization scripts, also runnable by themselves
├── submodules    # Various submodules, I use them as sources for symlinks
└── topics        # Config files and install scripts organized by topics
```

Any file in `/topics` beginning with a dot (such as `/topics/git/.gitconfig`) will be automagically symlinked to your home directory. Use a `+` character to indicate directories. For example, `/topics/git/.git-templates+hooks+post-commit` will be symlinked to `~/.git-templates/hooks/post-commit`

You can add an `install.sh` script to a topic if you need some additional setup upon (re)initialization. You can also name it `install.pre.sh` or `install.post.sh` if you need them to run in some special order.

All `.fish` files in `/topics` will be eagerly loaded upon shell startup. This is a good place to manage your `$PATH`. Do not add any aliases here, add them to the `/functions` directory instead to take advantage of lazy loading.

## Maintenance

Just run `dot` and you're good to go. This will reinitialize your dotfiles, i.e. recreate symlinks and run all install scripts. Running `dot` SHOULD be idemponent, so you can reinitialize as many times as you need to.
