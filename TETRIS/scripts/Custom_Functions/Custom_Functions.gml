function spawn_block(){
    var t = block_templates[irandom(array_length(block_templates) - 1)];
    
    var new_cells = [];
    
    for (var i=0; i<array_length(t.cells); i++) {
        new_cells[i] = {
            x: t.cells[i].x,
            y: t.cells[i].y
        };
    }
    
    return {
        cells: new_cells,
        x: 4,
        y: 0,
        sprite: t.sprite,
        val: t.val
    };
}