# wafflepie/dotfiles

The best ones out there, surely.

**WARNING:** My dotfiles contain a LOT of stuff, most of which you probably don't need. Instead of using my repository directly, you should do a couple of things:

- Create a fork.
- Review the code. Seriously.
- Remove any unneeded topics.

## Installation

**NOTE:** These dotfiles are supposed to work on a minimal installation of Fedora 32.

Run the following commands:

```sh
sudo dnf install git

# Replace `wafflepie` with your GitHub username if using a fork.
git clone --recurse-submodules https://github.com/wafflepie/dotfiles.git ~/.dotfiles

~/.dotfiles/binaries/dot
```

## Structure

The structure is built around topics, see [holman's dotfiles](https://github.com/holman/dotfiles) to learn more about this approach.

### Configuration files

Any file in `/topics` beginning with a dot (such as `/topics/git/.gitconfig`) will be automagically symlinked to your home directory. Use the `+` character to indicate a directory structure. For example, `/topics/git/.git-templates+hooks+post-commit` will be symlinked to `~/.git-templates/hooks/post-commit`.

Any `.zsh` files in `/topics` will be automatically sourced in the `.zshrc` file. You can also name them `.pre.zsh` or `.post.zsh` if you need to source them in a certain order.

**NOTE:** The `.post.zsh` files will be loaded AFTER all of the `antibody` plugins.

### Initialization

You can add an `.sh` script to a topic if you need some additional setup upon (re)initialization. As with the configuration files, you can use the `.pre.sh` and `.post.sh` suffixes to modify the order.

**NOTE:** These scripts should be [idempotent](https://en.wikipedia.org/wiki/Idempotence).

### Dumpfile

Any topic may include a `Dumpfile`, denoting that it contains some files which are meant to be autogenerated, but which are still supposed to be in source control, such as lists of packages.

## Maintenance

Running `dot` will reinitialize your dotfiles, i.e. recreate symlinks and run all install scripts. Running `dot` SHOULD be [idemponent](https://en.wikipedia.org/wiki/Idempotence), so you can reinitialize as many times as you need to.

If you only want to reinitialize some topics, run `dot topic1 topic2 topic3` instead.
