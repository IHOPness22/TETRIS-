if (state == STATE.WAITING) {
    move_tick++;
    if (move_tick >= wait_timer) {
        move_tick = 0;
        state = STATE.MOVING;
    }
} 

else if (state == STATE.MOVING) {
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
            state = STATE.STOP;
        }
        
    }
}