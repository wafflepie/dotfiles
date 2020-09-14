gitconfig_local_path="$HOME/.gitconfig.local"

if ! [[ -f "$gitconfig_local_path" ]]; then
  if is_wsl; then
    credential_helper='\/mnt\/c\/Program\\\\ Files\/Git\/mingw64\/libexec\/git-core\/git-credential-manager.exe'
  else
    credential_helper='store'
  fi

  echo 'enter your full name'
  read -e user_name
  echo 'enter your e-mail'
  read -e user_email

  sed \
    -e "s/USER_NAME/$user_name/g" \
    -e "s/USER_EMAIL/$user_email/g" \
    -e "s/CREDENTIAL_HELPER/$credential_helper/g" \
    template.txt > "$gitconfig_local_path"
fi
