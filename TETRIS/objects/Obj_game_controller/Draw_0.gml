draw_sprite_stretched(spr_box, 0, x - 270, y - 90, ds_grid_width(board) * cell, ds_grid_height(board) * cell);
   
var grid_w = ds_grid_width(board);
var grid_h = ds_grid_height(board);

var box_x = x - 270;
var box_y = y - 90;



//draw empty blocks on screen
for (var i = 0; i < grid_w; i++) {
    for (var j = 0; j < grid_h; j++) {
        var val = board[# i, j];
        
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
    }
    
}









