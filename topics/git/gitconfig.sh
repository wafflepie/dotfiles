if ! [[ -f "$DOTFILES/topics/git/.gitconfig.local" ]]; then
  credential_helper='osxkeychain'

  echo 'enter your full name'
  read -e user_name
  echo 'enter your e-mail'
  read -e user_email

  sed -e "s/USER_NAME/$user_name/g" \
    -e "s/USER_EMAIL/$user_email/g" \
    -e "s/CREDENTIAL_HELPER/$credential_helper/g" \
    "$DOTFILES/topics/git/.gitconfig.local.example" > "$DOTFILES/topics/git/.gitconfig.local"
fi
