function command_retry --description "Retry a command for specified iterations"
    # Parse arguments
    set --local options (fish_opt --short=n --long=iterations --required-val)
    set --local options $options (fish_opt --short=c --long=command --required-val)
    argparse $options -- $argv

    # Validate arguments
    if not set --query _flag_command
        set_color red
        echo "Error: Command argument is required"
        set_color normal
        return 1
    end

    set --local iterations 1
    if set --query _flag_iterations
        set iterations $_flag_iterations
    end

    # Execute command with retries
    for i in (seq 1 $iterations)
        eval $_flag_command
        if test $status -eq 0
            set_color green
            echo "✓ Command succeeded on iteration "(set_color --bold brwhite)"$i"(set_color normal)
            set_color normal
        else
            set --local exit_code $status
            set_color red
            echo "✗ Command failed on iteration "(set_color --bold)"$i"(set_color normal)(set_color red)" (exit $exit_code)"
            set_color normal
            return $exit_code
        end
    end
    set_color green --bold
    echo "✔ Command succeeded for all $iterations iterations!"
    set_color normal
    return 0
end
