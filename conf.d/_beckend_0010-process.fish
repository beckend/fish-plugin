function pid-mem-usage
    echo shared
    sudo cat "/proc/$argv[1]/smaps" | grep -i pss | awk '{Total+=$2} END {print Total/1024" MB"}'
    echo program
    sudo cat "/proc/$argv[1]/smaps" | grep -i rss | awk '{Total+=$2} END {print Total/1024" MB"}'
end
