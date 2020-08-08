curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# NOTE: If a change in `plugins.txt` has no effect, run `antibody purge <bundle-name-here>`.
antibody bundle < plugins.txt > ~/.zsh_plugins.sh
antibody update
