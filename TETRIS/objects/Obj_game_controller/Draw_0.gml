var grid_x = x - 270;
var grid_y = y - 90;

draw_sprite_stretched(current_block.sprite, 0, grid_x, grid_y, ds_grid_width(board) * cell, ds_grid_height(board) * cell);
   
var grid_w = ds_grid_width(board);
var grid_h = ds_grid_height(board);

var box_x = x - 270;
var box_y = y - 90;



//draw empty blocks on screen
for (var i = 0; i < grid_w; i++) {
    for (var j = 0; j < grid_h; j++) {
        val = board[# i, j];
        
        if (val == 0) {
            draw_sprite_ext(spr_empty_block, 0,
            box_x + i * cell,
            box_y + j * cell,
            cell / sprite_get_width(spr_empty_block),
            cell / sprite_get_height(spr_empty_block),
            0,
            c_white,
            1);
        }
        else {
        var spr = block_sprites[val]; // array that maps id -> sprite
        draw_sprite_ext(spr, 0,
        box_x + i * cell,
        box_y + j * cell,
        cell / sprite_get_width(spr),
        cell / sprite_get_height(spr),
        0, c_white, 1);
        }
        
        
    }
    
}

//draw current block on screen
for (var i = 0; i < array_length(current_block.cells); i++) {
    var cx = current_block.x + current_block.cells[i].x;
    var cy = current_block.y + current_block.cells[i].y;
    draw_sprite(current_block.sprite, 0, grid_x + cx * cell, grid_y + cy * cell);
}











