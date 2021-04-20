if type -q bun
    if not string length --quiet $BUN_HOME
        # This is broken, it ignores BUN_HOME and sets it in cache instead.
        # https://github.com/oven-sh/bun/issues/10152
        # set -x BUN_HOME $HOME/.bun
        set -gx BUN_HOME $HOME/.cache/.bun
        _beckend_set_path ~/.cache/.bun/bin
    end
end
