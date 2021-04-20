function _beckend_ssh_agent_is_started -d "check if ssh agent is already started"
    if not ps --pid "$SSH_AGENT_PID" &>/dev/null
        return 1
    end

    if test -f "$SSH_ENV"
        source "$SSH_ENV" >/dev/null
    end
end
