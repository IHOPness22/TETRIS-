move_tick++;
if (move_tick >= move_timer && locked == false) {
    move_tick = 0;
    current_block.y += 1;
    
    for (var i = 0; i < array_length(block1.cells); i++) {
    var cx = current_block.x + block1.cells[i].x;
    var cy = current_block.y + block1.cells[i].y;
    var next_yspot = ds_grid_get(board, current_block.x, current_block.y + 1)    
        if (cy >= ds_grid_height(board) - 1 || board[# cx, cy + 1] != 0) {
            locked = true;
        } 
    }
}
