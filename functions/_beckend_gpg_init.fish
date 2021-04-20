function _beckend_gpg_init -d 'init gpg-agent'
    # gpg-connect-agent reloadagent /bye >/dev/null

    set -gx GNUPGHOME "$HOME/.gnupg"

    set -l GNUPGCONFIG "$GNUPGHOME/gpg-agent.conf"

    if not test -e "$GNUPGCONFIG"
        return 1
    end

    if grep -q enable-ssh-support "$GNUPGCONFIG"
        set -ge SSH_AUTH_SOCK
        set -ge SSH_AGENT_PID
        set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
        set -gx GPG_TTY (tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null
    end
end
