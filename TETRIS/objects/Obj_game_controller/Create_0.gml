move_tick = 0;
move_timer = 30;
wait_timer = 20;
stop_block = 0;

x = 192;
y = 96;
cell = 32;

locked = false;


block1 = ds_list_create();
var coord_1 = {x: x + 128, y: y};
var coord_2 = {x: x + 160, y: y};
var coord_3 = {x: x + 128, y: y - 32};
var coord_4 = {x: x + 128, y: y - 64};
ds_list_add(block1, coord_1);
ds_list_add(block1, coord_2);
ds_list_add(block1, coord_3);
ds_list_add(block1, coord_4);

block2 = ds_list_create();
var coord_5 = {x: x + 128, y: y};
var coord_6 = {x: x + 160, y: y};
var coord_7 = {x: x + 128, y: y - 32};
var coord_8 = {x: x + 160, y: y - 32};
ds_list_add(block2, coord_5);
ds_list_add(block2, coord_6);
ds_list_add(block2, coord_7);
ds_list_add(block2, coord_8);

current_block = block1;

board = ds_grid_create(10, 21);

enum STATE {
    NEXT,
    WAITING,
    MOVING,
    STOP 
}

state = STATE.WAITING;

//21 to reach the bottom