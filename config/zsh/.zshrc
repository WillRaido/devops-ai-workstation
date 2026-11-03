# Safe optional integrations; does not install plugins or change shell automatically.
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"
command -v atuin >/dev/null && eval "$(atuin init zsh)"
welcome_hook="${XDG_CONFIG_HOME:-$HOME/.config}/workstation/welcome.zsh"
[[ -r "$welcome_hook" ]] && source "$welcome_hook"
unset welcome_hook
