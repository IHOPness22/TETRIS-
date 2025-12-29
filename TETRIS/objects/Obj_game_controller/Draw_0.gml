var box_w = 320;
var box_h = 672;

draw_sprite_stretched(spr_box, 0, x , y + 35, box_w, box_h);

for (var i = 0; i < ds_grid_width(board); i++) {
        for (var j=0; j < ds_grid_height(board); j++) {
            var block_type = board[# i, j];
            
            //Only draw if the cell isnt empty
            if (block_type != 0) {
               draw_sprite(spr_block, block_type, i.x, j.y);
            }
        }
}

if (state == STATE.WAITING) { 
    for (var i = 0; i < ds_list_size(current_block); i++) {
        var p = current_block[| i];
        draw_sprite(spr_block, 0, p.x, p.y);
    }
}

else if (state == STATE.MOVING) { 
    for (var i = 0; i < ds_list_size(current_block); i++) {
    var p = current_block[| i];
    draw_sprite(spr_block, 0, p.x, p.y);
    }
}
   









