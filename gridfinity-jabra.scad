include <jabra.scad>
include <lib/gridfinity-rebuilt-utility.scad>

//jabra();

gridfinityInit(2, 1, height(6), 0, 42) {
    cut_move(x=4, y=2, w=2, h=6) translate([0,0,-35]) jabra();    
}
gridfinityBase(2, 1, 42, 0, 0, 1);
