function mpv-sound-only
    /usr/bin/mpv --no-resume-playback --no-video --vo=null --mute=no --loop=inf $argv
end
