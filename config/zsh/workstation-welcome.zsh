# Optional welcome banner installed by DevOps AI Workstation.
autoload -Uz add-zsh-hook
_workstation_show_welcome() {
  add-zsh-hook -d precmd _workstation_show_welcome
  if [[ -o interactive && -t 1 ]]; then
  local config_home="${XDG_CONFIG_HOME:-$HOME/.config}/workstation"
  local message style border
    printf '\n\033[1;36m'
    if [[ -r "$config_home/welcome.txt" ]]; then IFS= read -r message < "$config_home/welcome.txt"; fi
    if [[ -r "$config_home/welcome-style.txt" ]]; then IFS= read -r style < "$config_home/welcome-style.txt"; fi
    if [[ -n "$message" ]]; then
      if [[ "$style" == ascii ]] && command -v figlet >/dev/null 2>&1; then
        figlet -w 72 "$message"
      elif [[ "$style" == ascii ]]; then
        border=$(printf '%*s' "$(( ${#message} + 4 ))" '' | tr ' ' '-')
        printf '+%s+\n|  %s  |\n+%s+\n' "$border" "$message" "$border"
      else
        printf '  ✦ %s ✦\n' "$message"
      fi
      printf '\033[0m\n'
    fi
  fi
  unfunction _workstation_show_welcome
}
add-zsh-hook precmd _workstation_show_welcome
