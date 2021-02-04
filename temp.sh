#!/bin/bash

# Source progress bar
source ./prog_bar.sh

main() {
    # Make sure that the progress bar is cleaned up when user presses ctrl+c
    enable_trapping
    # Create progress bar
    setup_scroll_area
    draw_progress_bar 0
    sleep 0.1
    draw_progress_bar 10
    sleep 0.1
    draw_progress_bar 40
    sleep 0.1
    block_progress_bar 45
    sleep 0.1
    draw_progress_bar 90
    sleep 1.0
    draw_progress_bar 99
    sleep 2.0
    echo "DONE"
    sleep 2.0
    draw_progress_bar 100
    sleep 2.0
    destroy_scroll_area
}

main
