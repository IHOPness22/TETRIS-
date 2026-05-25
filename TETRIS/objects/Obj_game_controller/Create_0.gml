board = ds_grid_create(10, 20);
ds_grid_clear(board, 0);
cell = 32;
occupied_cell = 0;
move_tick = 0;
fall_delay = 0;
points = 0;
line_check = 0;
line_total = 0;
level = 0;

#region 
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
    val: 1,
    
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
#endregion

#region   //block1
block1 = {
    states: [
        // state 0 (default)
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 0, y: 1},
            {x: 0, y: 2}
        ],

        // state 1 (90° clockwise)
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 2, y: 0},
            {x: 2, y: 1}
        ],

        // state 2 (180°)
        [
            {x: 1, y: 0},
            {x: 1, y: 1},
            {x: 1, y: 2},
            {x: 0, y: 2}
        ],

        // state 3 (270°)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 1, y: 1},
            {x: 2, y: 1}
        ]
    ], 
    x: 4,
    y: 0,
    rot_index: 0,
    sprite: spr_block_2,
    val: 1
}
#endregion

#region   //block2
block2 = {
    states: [
        [
            {x: 0, y: 0},
            {x: 1, y: 0},          // sqaure shape tetrimonial 
            {x: 0, y: 1},
            {x: 1, y: 1}
        ],
         [
            {x: 0, y: 0},
            {x: 1, y: 0},        
            {x: 0, y: 1},
            {x: 1, y: 1}
        ],
         [
            {x: 0, y: 0},
            {x: 1, y: 0},          
            {x: 0, y: 1},
            {x: 1, y: 1}
        ],
         [
            {x: 0, y: 0},
            {x: 1, y: 0},          
            {x: 0, y: 1},
            {x: 1, y: 1}
        ]
    ],
    
    x: 4,
    y: 0,
    sprite: spr_block,
    rot_index: 0,
    val: 2
}; 
#endregion

#region   //block3

block3 = {
    states: [
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 0, y: 2},         // | shape tetrimonial
            {x: 0, y: 3}
        ],
        // 1 horizontal
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 2, y: 0},
            {x: 3, y: 0}
        ],
        // 2 vertical (same as 0)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 0, y: 2},
            {x: 0, y: 3}
        ],
        // 3 horizontal (same as 1)
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 2, y: 0},
            {x: 3, y: 0}
        ]
    ],
    
    x: 4,
    y: 0,
    sprite: spr_block_3,
    rot_index: 0,
    val: 3
};
#endregion

#region   //block4
block4 = {
    states: [
        // 0 (up T)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 1, y: 1},
            {x: -1, y: 1}
        ],
        // 1 (right T)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 0, y: 2},
            {x: 1, y: 1}
        ],
        // 2 (down T)
        [
            {x: -1, y: 0},
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 0, y: 1}
        ],
        // 3 (left T)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 0, y: 2},
            {x: -1, y: 1}
        ]
    ],
    rot_index: 0,                     // ___  shape tetrimonial 
    x: 4,
    y: 0,
    sprite: spr_block_4,
    val: 4
};
#endregion

#region   //block5

block5 = {
    states: [
        // 0 (your current)
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 0, y: 1},
            {x: -1, y: 1}
        ],
        // 1 (rotated)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 1, y: 1},
            {x: 1, y: 2}
        ],
        // 2 (same as 0)
        [
            {x: 0, y: 0},
            {x: 1, y: 0},
            {x: 0, y: 1},
            {x: -1, y: 1}
        ],
        // 3 (same as 1)
        [
            {x: 0, y: 0},
            {x: 0, y: 1},
            {x: 1, y: 1},
            {x: 1, y: 2}
        ]
    ],
    rot_index: 0,
    x: 4,
    y: 0,
    sprite: spr_block_5,
    val: 5
};
#endregion



block_templates = [block1, block2, block3, block4, block5];
locked = false;
current_block = spawn_block(irandom(array_length(block_templates)-1));
next_block = spawn_block(irandom(array_length(block_templates)-1));
next = false;
can_move_left = true;
can_move_right = true;
full = noone;
next_rot = 0;
test_rot = 0;
chosen = false;

block_sprites = [];
block_sprites[1] = spr_block_2;
block_sprites[2] = spr_block;
block_sprites[3] = spr_block_3;
block_sprites[4] = spr_block_4;
block_sprites[5] = spr_block_5;

cells = current_block.states[current_block.rot_index];
new_cells = next_block.states[next_block.rot_index];



queue_list = [];
queue_list[0] = current_block;
queue_list[1] = next_block;
next_type = noone;

randomize();