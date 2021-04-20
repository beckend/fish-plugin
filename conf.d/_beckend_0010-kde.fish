if test -f /etc/arch-release && set -q WAYLAND_DISPLAY && type -q kbuildsycoca6
    XDG_MENU_PREFIX=arch- kbuildsycoca6 > /dev/null 2>&1
    clear
end
