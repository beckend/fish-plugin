function _beckend_env_set_default --no-scope-shadowing
    set -l ENV_NAME $argv[1]
    set -l ENV_VALUE_FALLBACK $argv[2]

    if set -q "$ENV_NAME"
        return 0
    end

    set -gx "$ENV_NAME" "$ENV_VALUE_FALLBACK"
end
