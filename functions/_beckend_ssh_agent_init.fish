function _beckend_ssh_agent_init -d "start ssh agent if applicable"
    _beckend_env_set_default GNUPGHOME "$HOME/.gnupg"

    set -l GNUPGCONFIG "$GNUPGHOME/gpg-agent.conf"

    if not test -e "$GNUPGCONFIG"
        return 1
    end

    # gpg-agent wants to take over so do not init
    if grep -q enable-ssh-support "$GNUPGCONFIG"
        return 1
    end

    if not _ssh_agent_is_started
        _ssh_agent_start
    end
end
