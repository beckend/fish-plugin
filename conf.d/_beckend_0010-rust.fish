if test -d ~/.cargo/bin
    _beckend_set_path ~/.cargo/bin
end

# This is equivalent to entering the following function:
function cargo_dir_clippy --wraps cargo --description 'enters the target directory, runs clippy inside a subshell'
    begin
        cd $argv[1]
        cargo clippy
        cd -
    end
end

complete -c cargo_dir_clippy -n __fish_use_subcommand -a '(__fish_complete_directories)' -d "Directory path"
