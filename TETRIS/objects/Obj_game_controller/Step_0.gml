leftKey = keyboard_check_pressed(ord("A"));
rightKey = keyboard_check_pressed(ord("D"));
spaceKey = keyboard_check_pressed(vk_space);
downKey = keyboard_check(ord("S"));

//movement based on input 

if rightKey {
    can_move_right = true;
    for (var i = 0; i < array_length(cells); i++) { 
    var cx = current_block.x + cells[i].x; 
    var cy = current_block.y + cells[i].y;    
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
    for (var i = 0; i < array_length(cells); i++) { 
    var cx = current_block.x + cells[i].x;
    var cy = current_block.y + cells[i].y;    
        if (cx <= 0 || board[# cx - 1, cy] != 0) { // -1 or occupied space
            can_move_left = false;
            break;
        }
    }
    if can_move_left { 
        current_block.x -= 1;
    }
}

if spaceKey {
        test_rot = (current_block.rot_index + 1) mod 4;
        can_rotate = true;
        var test_cells = current_block.states[test_rot];
        for (var i = 0; i < array_length(test_cells); i++) { 
            var px = current_block.x + test_cells[i].x;
            var py = current_block.y + test_cells[i].y;
        if px < 0 || px >= ds_grid_width(board) || py >= ds_grid_height(board) || board[# px , py] != 0 {
            can_rotate = false;
            break;
        }  
        }  
        if can_rotate {
            next_rot = (current_block.rot_index + 1) mod 4;
            current_block.rot_index = next_rot;
            cells = current_block.states[current_block.rot_index];
        } 
            
        //next_rot = (current_block.rot_index + 1) mod 4;
       
}

if downKey { move_speed = 3; }  else { move_speed = 1; }


//check move_timer depending on the level 
fall_delay = max(30 - level * 2, 5);


if (!chosen) { 
    chosen = true;
    next_block = spawn_block(irandom(array_length(block_templates)-1)); 
    new_cells = next_block.states[next_block.rot_index];
} 



//check if piece can still fall and if not, lock it and save it to the grid

var can_fall = true;
move_tick += 1 * move_speed;
if (move_tick >= fall_delay && locked == false && next == false) {
    move_tick = 0;
    for (var i = 0; i < array_length(cells); i++) { 
    var cx = current_block.x + cells[i].x;
    var cy = current_block.y + cells[i].y;
        if (cy >= ds_grid_height(board) - 1 || board[# cx, cy + 1] != 0) {
            can_fall = false;
            break;
        } 
    }
    if (can_fall) { current_block.y += 1; }
    else {locked = true; }
    
}

else if (locked == true && next == false) {
    for (var i = 0; i < array_length(cells); i++) { 
    var cx = current_block.x + cells[i].x;
    var cy = current_block.y + cells[i].y;
    board[# cx, cy] = current_block.val;
    }
    locked = false;
    next = true;
}

else if (next == true && locked == false) {
    next = false;
    current_block = next_block;
    //this will be for summmoning
    cells = new_cells;
    next_rot = 0;
    chosen = false;
}


line_check = 0;

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
        line_check += 1;
        line_total += 1;
        for (var j = 0; j < ds_grid_width(board); j++) {
            ds_grid_set(board, j, i, 0);
        }
        
        for (var j = 0; j < ds_grid_width(board); j++) {
            for (var val = i - 1; val >= 0; val--) {
                var new_val = ds_grid_get(board, j, val);
                ds_grid_set(board, j, val + 1, new_val);
            }
            
            
        }
        i -= 1;
                     
    }
}

 if line_check == 1 { points += 40;}
        else if line_check == 2 { points += 100;}
        else if line_check == 3 { points += 300;}
        else if line_check == 4 { points += 1200;} 

//we need to check when its time to level up  
level = floor(line_total / 10);





