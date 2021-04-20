if type -q lsd
    function ls --wraps rm --description 'ls functionality'
        lsd $argv
    end
end
