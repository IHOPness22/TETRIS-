var can_fall = true;
move_tick++;
if (move_tick >= move_timer && locked == false && next == false) {
    move_tick = 0;
    for (var i = 0; i < array_length(current_block.cells); i++) { 
    var cx = current_block.x + current_block.cells[i].x;
    var cy = current_block.y + current_block.cells[i].y;
        if (cy >= ds_grid_height(board) - 1 || board[# cx, cy + 1] != 0) {
            can_fall = false;
            break;
        } 
    }
    if (can_fall) { current_block.y += 1; }
    else {locked = true; }
    
}

else if (locked == true && next == false) {
    for (var i = 0; i < array_length(current_block.cells); i++) { 
    var cx = current_block.x + current_block.cells[i].x;
    var cy = current_block.y + current_block.cells[i].y;
    board[# cx, cy] = current_block.val;
    }
    locked = false;
    next = true;
}

else if (next == true && locked == false) {
    next = false;
    current_block = spawn_block();
}