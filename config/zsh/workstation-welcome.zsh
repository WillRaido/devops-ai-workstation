# Optional welcome banner installed by DevOps AI Workstation.
_workstation_show_welcome() {
  [[ -o interactive ]] || return 0
  local config_home="${XDG_CONFIG_HOME:-$HOME/.config}/workstation"
  local message style border
  [[ -r "$config_home/welcome.txt" ]] || return 0
  IFS= read -r message < "$config_home/welcome.txt"
  IFS= read -r style < "$config_home/welcome-style.txt"
  [[ -n "$message" ]] || return 0
  if [[ -t 1 ]]; then
    printf '\n\033[1;36m'
  else
    printf '\n'
  fi
  if [[ "$style" == ascii ]]; then
    border=$(printf '%*s' "$(( ${#message} + 4 ))" '' | tr ' ' '-')
    printf '+%s+\n|  %s  |\n+%s+\n' "$border" "$message" "$border"
  else
    printf '  ✦ %s ✦\n' "$message"
  fi
  if [[ -t 1 ]]; then printf '\033[0m'; fi
  printf '\n'
}
_workstation_show_welcome
unfunction _workstation_show_welcome
