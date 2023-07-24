include <lib/gridfinity-rebuilt-utility.scad>

module pad_storage() {
    difference() {
    cube([55, 80, 90]);
    color("red") translate([0, 37.5, 0]) cube([55, 5, 90]);
    }
    color("blue") translate([55/2, 80/2, 0]) cylinder(r=10, h=90);
}

module gridfinity_pad_storage() {
    gridfinityInit(2, 2, height(6), 0, 42) {
        cut_move(x=5.35, y=5.93, w=2, h=6) translate([0,0,-25]) pad_storage();    
    }
    gridfinityBase(2, 2, 42, 0, 0, style_hole=0);
}

//pad_storage();
gridfinity_pad_storage();