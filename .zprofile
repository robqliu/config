case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) eval "$(/opt/homebrew/bin/brew shellenv)" ;;
esac

# Not sure if this is necessary for generating gpg keys... but I did it
# https://superuser.com/a/1407685
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
gpgconf --launch gpg-agent
