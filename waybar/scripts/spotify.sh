#!/bin/bash

play_icon="▶"
pause_icon="⏸︎"

middle_char="𜱭"
filled_char="━"
empty_char="·"

player_status=$(playerctl -p spotify_player status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl -p spotify_player metadata artist)
    title=$(playerctl -p spotify_player metadata title)

    # Get position and length (in microseconds from playerctl, but can be float seconds)
    position_raw=$(playerctl -p spotify_player position 2>/dev/null)
    length_raw=$(playerctl -p spotify_player metadata mpris:length 2>/dev/null)

    # Convert raw output to integers (seconds) using bc for safety with potential floats
    # playerctl position can output float seconds, mpris:length is usually int microseconds
    # We will convert both to seconds for consistency
    if [ -n "$position_raw" ] && [ -n "$length_raw" ]; then
        # If length_raw is in microseconds (typical for mpris:length), convert to seconds
        # If position_raw is already in seconds (common for `position` output), use it directly
        position_s=$(echo "$position_raw" | awk '{printf "%d", $1}') # Just take integer part if it's float seconds
        length_s=$(echo "scale=0; $length_raw / 1000000" | bc) # Convert microseconds to seconds
    else
        position_s=0
        length_s=0
    fi

    # Calculate progress percentage using bc for float division then rounding
    if [ "$length_s" -gt 0 ]; then
        progress_percent=$(echo "scale=0; ($position_s * 100) / $length_s" | bc)
    else
        progress_percent=0
    fi

    bar_length=20
    # Use bash arithmetic for integer calculation here
    filled_chars=$((progress_percent * bar_length / 100))
    empty_chars=$((bar_length - filled_chars))


    for (( i=0; i<filled_chars-1; i++ )); do
        progress_bar+=$filled_char
    done
    
    progress_bar+=$middle_char

    for (( i=0; i<empty_chars; i++ )); do
        progress_bar+=$empty_char
    done

    # Format time (MM:SS) using bash arithmetic
    current_time=$(printf "%02d:%02d" $((position_s / 60)) $((position_s % 60)))
    total_time=$(printf "%02d:%02d" $((length_s / 60)) $((length_s % 60)))

    echo "{\"text\": \"${play_icon} ${artist} - ${title} ${current_time}/${total_time} ${progress_bar}\", \"class\": \"playing\"}"
elif [ "$player_status" = "Paused" ]; then
    artist=$(playerctl -p spotify_player metadata artist)
    title=$(playerctl -p spotify_player metadata title)
    
    # Optional: Display progress bar even when paused
    position_raw=$(playerctl -p spotify_player position 2>/dev/null)
    length_raw=$(playerctl -p spotify_player metadata mpris:length 2>/dev/null)
    if [ -n "$position_raw" ] && [ -n "$length_raw" ]; then
        position_s=$(echo "$position_raw" | awk '{printf "%d", $1}')
        length_s=$(echo "scale=0; $length_raw / 1000000" | bc)
    else
        position_s=0
        length_s=0
    fi

    if [ "$length_s" -gt 0 ]; then
        progress_percent=$(echo "scale=0; ($position_s * 100) / $length_s" | bc)
    else
        progress_percent=0
    fi

    bar_length=20
    filled_chars=$((progress_percent * bar_length / 100))
    empty_chars=$((bar_length - filled_chars))


    for (( i=0; i<filled_chars-1; i++ )); do
        progress_bar+=$filled_char
    done
    
    progress_bar+=$middle_char

    for (( i=0; i<empty_chars; i++ )); do
        progress_bar+=$empty_char
    done

    current_time=$(printf "%02d:%02d" $((position_s / 60)) $((position_s % 60)))
    total_time=$(printf "%02d:%02d" $((length_s / 60)) $((length_s % 60)))
    
    echo "{\"text\": \"${pause_icon} ${artist} - ${title} ${current_time}/${total_time} ${progress_bar}\", \"class\": \"paused\"}"
else

    bar_length=20
    filled_chars=15
    empty_chars=15


    for (( i=0; i<filled_chars-1; i++ )); do
        progress_bar+=$filled_char
    done
    
    progress_bar+=$middle_char


    for (( i=0; i<empty_chars; i++ )); do
        progress_bar+=$empty_char
    done

    echo "{\"text\": \"${progress_bar}\", \"class\": \"stopped\"}"
fi
