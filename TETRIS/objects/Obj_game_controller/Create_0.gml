board = ds_grid_create(10, 20);
cell = 32;
occupied_cell = 0;
move_tick = 0;
move_timer = 30;


block1 = {
    cells: [
    {x: 0, y: 0},
    {x: 1, y: 0},
    {x: 0, y: 1},
    {x: 0, y: 2}
    ],
    
    x: 4,
    y: 0
};

current_block = block1;
locked = false;
