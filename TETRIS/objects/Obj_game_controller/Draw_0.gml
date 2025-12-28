var box_w = 320;
var box_h = 672;

draw_sprite_stretched(spr_box, 0, x , y + 35, box_w, box_h);

if (state = STATE.WAITING) { 
    for (var i = 0; i < ds_list_size(current_block); i++) {
        var p = current_block[| i];
        draw_sprite(spr_block, 0, p.x, p.y);
    }
}

if (state = STATE.MOVING) { 
    for (var i = 0; i < ds_list_size(current_block); i++) {
    var p = current_block[| i];
    draw_sprite(spr_block, 0, p.x, p.y);
    }
}
   
if (state = STATE.STOP) { 
    for (var i = 0; i < ds_list_size(current_block); i++) {
    var p = current_block[| i];
    draw_sprite(spr_block, 0, p.x, p.y);
    }
} 





