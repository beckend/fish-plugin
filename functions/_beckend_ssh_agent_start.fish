function _beckend_ssh_agent_start -d "start a new ssh agent"
    if not ps --pid "$SSH_AGENT_PID" &>/dev/null
        ssh-agent -c | sed 's/^echo/#echo/' >"$SSH_ENV"
        chmod 600 "$SSH_ENV"
    end

    if test -f "$SSH_ENV"
        source "$SSH_ENV" >/dev/null
    end
end
