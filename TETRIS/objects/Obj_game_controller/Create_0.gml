board = ds_grid_create(10, 20);
ds_grid_clear(board, 0);
cell = 32;
occupied_cell = 0;
move_tick = 0;
move_timer = 20;


block1 = {
    cells: [
    {x: 0, y: 0},          // L shape tetrimonial 
    {x: 1, y: 0},   
    {x: 0, y: 1},   
    {x: 0, y: 2}
    ],
    
    x: 4,
    y: 0,
    sprite: spr_block_2,
    val: 1
};

block2 = {
    cells: [
    {x: 0, y: 0},
    {x: 1, y: 0},          // sqaure shape tetrimonial 
    {x: 0, y: 1},
    {x: 1, y: 1}
    ],
    
    x: 4,
    y: 0,
    sprite: spr_block ,
    val: 2
}; 

block3 = {
    cells: [
    {x: 0, y: 0},
    {x: 0, y: 1},
    {x: 0, y: 2},         // | shape tetrimonial
    {x: 0, y: 3}
    ],
    
    x: 4,
    y: 0,
    sprite: spr_block_3,
    val: 3
};

block4 = {
    cells: [
    {x: 0, y: 0},
    {x: 0, y: 1},
    {x: 1, y: 1},
    {x: -1, y: 1}          //  d|
    ],                     // ___  shape tetrimonial 
    x: 4,
    y: 0,
    sprite: spr_block_4,
    val: 4
};

block5 = {
    cells: [
    {x: 0, y: 0},
    {x: 1, y: 0},
    {x: 0, y: 1},
    {x: -1, y: 1}                     // opp z shape tetrimonial
    ],
    x: 4,
    y: 0,
    sprite: spr_block_5,
    val: 5
};

block_templates = [block1, block2, block3, block4, block5];
locked = false;
current_block = spawn_block();
next = false;
can_move_left = true;
can_move_right = true;
full = noone;

block_sprites = [];
block_sprites[1] = spr_block_2;
block_sprites[2] = spr_block;
block_sprites[3] = spr_block_3;
block_sprites[4] = spr_block_4;
block_sprites[5] = spr_block_5;


