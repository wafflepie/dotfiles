custom_battery_level() {
  local percentage1=$(pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p')
  local percentage=$(echo "${percentage1//\%}")
  local color='%F{red}'
  local symbol="\uf00d"

  pmset -g ps | grep "discharging" > /dev/null

  if [[ $? -eq 0 ]]; then
    local charging="false"
  else
    local charging="true"
  fi

  if [[ $percentage -le 20 ]]; then
    symbol='\uf579'
    color='%F{red}'
  elif [[ $percentage -gt 19 ]] && [[ $percentage -le 30 ]]; then
    symbol="\uf57a"
    color='%F{red}'
  elif [[ $percentage -gt 29 ]] && [[ $percentage -le 40 ]]; then
    symbol="\uf57b"
    color='%F{yellow}'
  elif [[ $percentage -gt 39 ]] && [[ $percentage -le 50 ]]; then
    symbol="\uf57c"
    color='%F{yellow}'
  elif [[ $percentage -gt 49 ]] && [[ $percentage -le 60 ]]; then
    symbol="\uf57d"
    color='%F{blue}'
  elif [[ $percentage -gt 59 ]] && [[ $percentage -le 70 ]]; then
    symbol="\uf57e"
    color='%F{blue}'
  elif [[ $percentage -gt 69 ]] && [[ $percentage -le 80 ]]; then
    symbol="\uf57f"
    color='%F{blue}'
  elif [[ $percentage -gt 79 ]] && [[ $percentage -le 90 ]]; then
    symbol="\uf580"
    color='%F{blue}'
  elif [[ $percentage -gt 89 ]] && [[ $percentage -le 99 ]]; then
    symbol="\uf581"
    color='%F{blue}'
  elif [[ $percentage -gt 98 ]]; then
    symbol="\uf578"
    color='%F{green}'
  fi

  if [[ $charging = "true" ]]; then
    color='%F{green}'

    if [[ $percentage -gt 98 ]]; then
      symbol='\uf584'
    fi
  fi

  echo -n "%{$color%}$symbol"
}

custom_internet_signal() {
  # http://www.wireless-nets.com/resources/tutorials/define_snr_values.html
  # http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440
	local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  local snr=$(bc <<< "scale=2; $signal / $noise")

  local net=$(curl -D- -o /dev/null -s http://www.google.com | grep HTTP/1.1 | awk '{print $2}')
  local color='%F{yellow}'
  local symbol="\uf197"

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $snr -gt .40 ]]; then
    color='%F{blue}'
    symbol="\uf1eb"
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $snr -gt .40 ]] && [[ $snr -gt .25 ]]; then
    color='%F{green}'
    symbol="\uf1eb"
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $snr -gt .25 ]] && [[ $snr -gt .15 ]]; then
    color='%F{yellow}'
    symbol="\uf1eb"
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $snr -gt .15 ]] && [[ $snr -gt .10 ]]; then
    color='%F{red}'
    symbol="\uf1eb"
  fi

  # No Signal
  if [[ ! -z "${signal// }" ]] && [[ ! $snr -gt .10 ]]; then
    color='%F{red}'
    symbol="\uf011"
  fi

  if [[ -z "${signal// }" ]] && [[ "$net" -ne 200 ]]; then
    color='%F{red}'
    symbol="\uf011"
  fi

  # Ethernet Connection
  if [[ -z "${signal// }" ]] && [[ "$net" -eq 200 ]]; then
    color='%F{blue}'
    symbol="\uf197"
  fi

  echo -n "%{$color%}$symbol "
}
