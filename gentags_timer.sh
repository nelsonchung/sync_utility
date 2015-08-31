for count in $(seq 1 64)
    do 
        gentags 1>/dev/null 2>&1 &
        sleep 600 
    done
