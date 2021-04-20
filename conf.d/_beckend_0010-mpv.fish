function mpv-sound-only
    mpv --no-resume-playback --no-video --vo=null --mute=no --loop=inf $argv
end
