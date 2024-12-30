PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin"
export SSH_AUTH_SOCK="$(gpgconf -L agent-ssh-socket)"
[ "$DISPLAY" ] || [ "$XDG_VTNR" -ne 1 ] || exec xinit >/dev/null
