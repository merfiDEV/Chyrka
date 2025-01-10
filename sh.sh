# Simple Snake Game in Bash

# Initialize game variables
snake=()
snake_length=5
food_position=0
width=20
height=10
game_over=0

# Function to draw the game board
draw_board() {
    clear
    for ((i=0; i<height; i++)); do
        for ((j=0; j<width; j++)); do
            if [[ $i -eq 0 || $i -eq $((height-1)) || $j -eq 0 || $j -eq $((width-1)) ]]; then
                echo -n "#"
            elif [[ $i -eq ${snake[0]} && $j -eq ${snake[1]} ]]; then
                echo -n "O"
            elif [[ $i -eq $food_position && $j -eq $food_position ]]; then
                echo -n "*"
            else
                echo -n " "
            fi
        done
        echo
    done
}

# Function to move the snake
move_snake() {
    local new_head_x=$((snake[0] + direction_x))
    local new_head_y=$((snake[1] + direction_y))
    
    # Check for collisions
    if [[ $new_head_x -le 0 || $new_head_x -ge $((height-1)) || $new_head_y -le 0 || $new_head_y -ge $((width-1)) ]]; then
        game_over=1
    fi
    
    # Update snake position
    snake=("$new_head_x" "$new_head_y")
}

# Main game loop
while [[ $game_over -eq 0 ]]; do
    draw_board
    read -t 0.1 -n 1 input
    case $input in
        w) direction_x=-1; direction_y=0 ;;  # Up
        s) direction_x=1; direction_y=0 ;;   # Down
        a) direction_x=0; direction_y=-1 ;;  # Left
        d) direction_x=0; direction_y=1 ;;   # Right
    esac
    move_snake
done

echo "Game Over!"