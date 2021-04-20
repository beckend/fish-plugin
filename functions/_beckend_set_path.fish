function _beckend_set_path -d 'set user paths if not set already.'
    for pathTarget in $argv
        # qouting $fish_user_paths will make fish slowmotion
        contains "$pathTarget" $PATH; or fish_add_path -gmPp "$pathTarget"
    end
end
