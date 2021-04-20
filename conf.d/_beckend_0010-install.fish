set -U fish_greeting

function _init_install --on-event 0010-install_install
    _beckend_plugins_install
end

function _init_update --on-event 0010-install_update
    _beckend_plugins_install
end
