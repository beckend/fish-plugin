function _beckend_plugins_install
    set -l FILE_PLUGINS "$__fish_config_dir/fish_plugins"
    touch "$FILE_PLUGINS"
    set -l CONTENTS_FILE_PLUGIN_ORIGINAL ""
    cat "$FILE_PLUGINS" | read CONTENTS_FILE_PLUGIN_ORIGINAL -z
    set -l PLUGINS_TO_INSTALL IlanCosman/tide kfkonrad/last-working-dir-fish-pkg tomyun/base16-fish franciscolourenco/done gazorby/fish-abbreviation-tips fisher install realiserad/fish-ai

    for plugin in $PLUGINS_TO_INSTALL
        _beckend_add_to_file_if_not_exist "$FILE_PLUGINS" "$plugin"
    end

    set -l CONTENTS_FILE_PLUGIN_NEW ""
    cat "$FILE_PLUGINS" | read CONTENTS_FILE_PLUGIN_NEW -z

    if test "$CONTENTS_FILE_PLUGIN_NEW" != "$CONTENTS_FILE_PLUGIN_ORIGINAL"
        fisher update
    end
end
