#!/usr/bin/env bash

set -e
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES"

if ! [[ -f "topics/git/.gitconfig.local" ]]; then
  echo 'setting up gitconfig'

  credential_helper='osxkeychain'

  echo 'enter your full name'
  read -e user_name
  echo 'enter your e-mail'
  read -e user_email

  sed -e "s/USER_NAME/$user_name/g" \
    -e "s/USER_EMAIL/$user_email/g" \
    -e "s/CREDENTIAL_HELPER/$credential_helper/g" \
    "topics/git/.gitconfig.local.example" > "topics/git/.gitconfig.local"

  echo 'gitconfig successfully set up'
fi
