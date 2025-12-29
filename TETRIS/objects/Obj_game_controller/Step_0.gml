if (state == STATE.WAITING) {
    move_tick++;
    if (move_tick >= wait_timer) {
        move_tick = 0;
        state = STATE.MOVING;
    }
} 

else if (state == STATE.MOVING && locked == false) {
    move_tick++;
    if (move_tick >= move_timer) { 
        move_tick = 0; 
    
        for (var i = 0; i < ds_list_size(current_block); i++) {
            var p = current_block[| i];
            p.y += cell;
            current_block[| i] = p;
        }
        
        stop_block++;
        if stop_block >= 21 { 
            stop_block = 0;
            locked = true;
            state = STATE.STOP;
        }
        
    }
}

else if (state == STATE.STOP) {
    for (var i=0; i < ds_list_size(current_block); i++) {
        var p = current_block[| i];
        var local_x = p.x - x;
        var local_y = p.y - y;
        var col = local_x div cell;
        var row = local_y div cell;
        ds_grid_set(board, col, row, 1);
        
    }
    state = STATE.NEXT;
}

else if (state == STATE.NEXT) {
    current_block = block2; 
    state = STATE.WAITING;
    locked = false;
    
}