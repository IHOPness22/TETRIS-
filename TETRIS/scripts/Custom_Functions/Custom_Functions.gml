/*function spawn_block(){
    var t = block_templates[irandom(array_length(block_templates) - 1)];
    
    var new_states = [];
    
    for (var s=0; s<array_length(t.states); s++) {
        new_states[s] = [];
        for (var c=0; c < array_length(t.states[s]); c++) {
            new_states[s][c] = { x: t.states[s][c].x, y: t.states[s][c].y};
        }
    }
    
    return {
        states: new_states,
        x: 4,
        y: 0,
        sprite: t.sprite,
        rot_index: 0,
        val: t.val
    };
} */

function display_next_block(){
    var t = block_templates[irandom(array_length(block_templates) - 1)];
    
    return t;
}

function spawn_block(selected) {
    var t = block_templates[selected];
    var new_states = [];
    
    for (var s=0; s <array_length(t.states); s++) {
        new_states[s] = [];
        for (var c=0; c < array_length(t.states[s]); c++) {
            new_states[s][c] = { x: t.states[s][c].x, y: t.states[s][c].y};
        }
    }
    
    return {
        states: new_states,
        x: 4,
        y: 0,
        sprite: t.sprite,
        rot_index: 0,
        val: t.val
    };
}

/*
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