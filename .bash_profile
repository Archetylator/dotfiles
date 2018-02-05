# When bash is invoked as an interactive login shell, or as a non-interactive shell with the --login
# option, it reads this file.

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"
