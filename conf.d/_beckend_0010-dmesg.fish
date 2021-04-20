function dmesg
    journalctl --dmesg -o short-monotonic --no-hostname $argv
end
