leftKey = keyboard_check_pressed(ord("A"));
rightKey = keyboard_check_pressed(ord("D"));

//movement based on input 

if rightKey {
    can_move_right = true;
    for (var i = 0; i < array_length(current_block.cells); i++) { 
    var cx = current_block.x + current_block.cells[i].x; 
    var cy = current_block.y + current_block.cells[i].y;    
        if (cx >= ds_grid_width(board) - 1 || board[# cx + 1, cy] != 0 ) { // 10 or occupied space
            can_move_right = false;
            break;
        }
    }
    if can_move_right { 
        current_block.x += 1;
    }
}

if leftKey {
    can_move_left = true;
    for (var i = 0; i < array_length(current_block.cells); i++) { 
    var cx = current_block.x + current_block.cells[i].x;
    var cy = current_block.y + current_block.cells[i].y;    
        if (cx <= 0 || board[# cx - 1, cy] != 0) { // -1 or occupied space
            can_move_left = false;
            break;
        }
    }
    if can_move_left { 
        current_block.x -= 1;
    }
}





//check if piece can still fall and if not, lock it and save it to the grid

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



//check if row is full 
for (var i=0; i < ds_grid_height(board); i++) { //assume row is full
    full = true;
    
    for (var j = 0; j < ds_grid_width(board); j++) {
        if (board[# j, i] == 0) { 
            full = false;   //however if we find a 0 value in that row than it 
            break;      //instantly eliminates it 
        }
        
    }
     if (full) {
        for (var j = 0; j < ds_grid_width(board); j++) {
            ds_grid_set(board, j, i, 0);
        }
        
        for (var j = 0; j < ds_grid_width(board); j++) {
            for (var val = i - 1; val >= 0; val--) {
                var new_val = ds_grid_get(board, j, val);
                ds_grid_set(board, j, val + 1, new_val);
            }
        }
    }
}

 





