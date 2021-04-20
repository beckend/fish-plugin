# XDG
if not string length --quiet $XDG_CACHE_HOME
    set -x XDG_CACHE_HOME $HOME/.cache
end

if not string length --quiet $XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME $HOME/.config
end

if not string length --quiet $XDG_DATA_HOME
    set -x XDG_DATA_HOME $HOME/.local/share
end

if not string length --quiet $XDG_STATE_HOME
    set -x XDG_STATE_HOME $HOME/.local/state
end

if not string length --quiet $XDG_DESKTOP_DIR
    set -x XDG_DESKTOP_DIR $HOME/Desktop
end

if not string length --quiet $XDG_DOWNLOAD_DIR
    set -x XDG_DOWNLOAD_DIR $HOME/Downloads
end

if not string length --quiet $XDG_DOCUMENTS_DIR
    set -x XDG_DOCUMENTS_DIR $HOME/Documents
end

if not string length --quiet $XDG_MUSIC_DIR
    set -x XDG_MUSIC_DIR $HOME/Music
end

if not string length --quiet $XDG_PICTURES_DIR
    set -x XDG_PICTURES_DIR $HOME/Pictures
end

if not string length --quiet $XDG_VIDEOS_DIR
    set -x XDG_VIDEOS_DIR $HOME/Videos
end
