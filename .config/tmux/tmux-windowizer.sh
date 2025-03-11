#!/usr/bin/env bash

# Step 1: Select the directory either through argument or fzf
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/gitOps ~/obsidian ~/gitHub ~/projects ~/scripts ~/devOps -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Step 2: Exit if no selection is made
if [[ -z $selected ]]; then
    exit 0
fi

# Step 3: Clean up the selected name for tmux (replace dots with underscores)
selected_name=$(basename "$selected" | tr . _)

# Check if tmux is running
tmux_running=$(pgrep tmux)

# Step 4: If not inside tmux and tmux isn't running, create a new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

# Function to check if window exists in the current session
window_exists_in_current_session() {
    tmux list-windows -F '#W' | grep -q "^$selected_name$"
}

# Function to check if the window exists in other sessions
window_exists_in_other_sessions() {
    tmux list-windows -a -F '#S:#W' | grep -q "^[^$(tmux display-message -p "#S")]:$selected_name$"
}

# Step 5: Check if the window exists in the current session
if window_exists_in_current_session; then
    # If the window exists in the current session, switch to it
    tmux select-window -t $selected_name
else
    # Check if the window exists in another session
    if window_exists_in_other_sessions; then
        # If the window exists in another session, create a new window with a unique name
        unique_name="${selected_name}_new_$(date +%s)"
        tmux new-window -n $unique_name -c $selected
        tmux select-window -t $unique_name
    else
        # If the window doesn't exist in any session, create a new one in the current session
        tmux new-window -n $selected_name -c $selected
        tmux select-window -t $selected_name
    fi
fi
