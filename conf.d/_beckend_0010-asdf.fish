if type -q mise
    mise activate fish | source
    return 0
end

if not type -q rg
    echo 'please install command "rg" https://github.com/BurntSushi/ripgrep'
else
    if test (id -u) -ne 0 && test -e ~/.asdf/asdf.fish
        set -Ux ASDF_FORCE_PREPEND yes
        source ~/.asdf/asdf.fish
        source ~/.asdf/completions/asdf.fish

        if not test -L /etc/fish/completions/asdf.fish && test -f /usr/share/fish/vendor_completions.d/asdf.fish
            # sudo ln -sf /usr/share/fish/vendor_completions.d/asdf.fish /etc/fish/completions/asdf.fish
            echo 'asdf completions not enabled - run:'
            echo 'sudo ln -sf /usr/share/fish/vendor_completions.d/asdf.fish /etc/fish/completions/asdf.fish'
        end

        set -l PATH_FILE_PLUGIN_JAVA_SET_HOME ~/.asdf/plugins/java/set-java-home.fish
        set -l PATH_FILE_PLUGIN_JAVA_SET_HOME_EXISTS (fileExists "$PATH_FILE_PLUGIN_JAVA_SET_HOME")

        function _beckend_asdf_init_java -V PATH_FILE_PLUGIN_JAVA_SET_HOME -V PATH_FILE_PLUGIN_JAVA_SET_HOME_EXISTS
            if test "$PATH_FILE_PLUGIN_JAVA_SET_HOME_EXISTS" = true
                source "$PATH_FILE_PLUGIN_JAVA_SET_HOME"
            end
        end

        function _beckend_asdf_query_tool_versions_string_match
            set -l FILE_CURRENT_TOOL_VERSIONS $argv[1]
            set -l STRING_SEARCH $argv[2]

            if test -f $FILE_CURRENT_TOOL_VERSIONS
                rg -q "$STRING_SEARCH" $FILE_CURRENT_TOOL_VERSIONS

                if test $status -eq 0
                    echo true
                else
                    echo false
                end
            else
                echo false
            end
        end

        function _beckend_asdf_on_pwd -d 'arch linux installation' -v PWD
            set -l FILE_CURRENT_TOOL_VERSIONS "$PWD/.tool-versions"
            set -l FILE_CURRENT_TOOL_VERSIONS_HAS_JAVA (_beckend_asdf_query_tool_versions_string_match "$PWD/.tool-versions" 'java ')

            if test "$FILE_CURRENT_TOOL_VERSIONS_HAS_JAVA" = true
                _beckend_asdf_init_java
            end
        end

        _beckend_asdf_on_pwd

        if not set -q JAVA_HOME
            set -l FILE_CURRENT_TOOL_VERSIONS_HAS_JAVA (_beckend_asdf_query_tool_versions_string_match ~/.tool-versions 'java ')

            if test "$FILE_CURRENT_TOOL_VERSIONS_HAS_JAVA" = true
                _beckend_asdf_init_java
            end
        end
    end
end
