include <lib/gridfinity-rebuilt-utility.scad>


function add(v, i = 0, r = 0) = i < len(v) ? add(v, i + 1, r + v[i]) : r;

tap_d_h = [
    [4, 27, "M3"],
    [5, 32, "M4"],
    [5, 33, "M5"],
    [6, 34, "M6"],
    [6.5, 34, "M8"],
    [8, 39, "M10"],
    [9, 39, "M12"],
];
    
module tap_holes() {
    slack = 1;
    total_len = 83;
    total_hole_len = add([for (i=tap_d_h) i[0]]);
    leftover_space = total_len - total_hole_len;
    between_space = leftover_space / (len(tap_d_h) + 2);

    for (i = [0 : len(tap_d_h) - 1]) {
        new_x = ((i == 0) ? between_space : (add([for (j = [0 : i-1]) tap_d_h[j][0]]) + (i+1)*between_space)) +tap_d_h[i][0];
        translate([new_x, 0, 42 - tap_d_h[i][1]]) cylinder(r=(tap_d_h[i][0] + slack)/2, h=tap_d_h[i][1]);
    }
}

module tap_names() {
    slack = 1;
    total_len = 83;
    total_hole_len = add([for (i=tap_d_h) i[0]]);
    leftover_space = total_len - total_hole_len;
    between_space = leftover_space / (len(tap_d_h) + 2);

    for (i = [0 : len(tap_d_h) - 1]) {
        new_x = ((i == 0) ? between_space : (add([for (j = [0 : i-1]) tap_d_h[j][0]]) + (i+1)*between_space)) +tap_d_h[i][0];
        translate([new_x, -10, 42]) {
            linear_extrude(1) {
                text(tap_d_h[i][2], size=4, halign="center");
            }
        }
    }
}

module gridfinity_tap_tools() {
    gridfinityInit(2, 1, height(6), 0, 42) {
        /*
        cut_move(x=0, y=0, w=2, h=6) {
            translate([0, 0, -40]) tap_holes();
        }
        */
    }
    gridfinityBase(2, 1, 42, 0, 0, style_hole=0);
    //color("green") translate([0,0,0]) tap_holes();
}


difference() {
    gridfinity_tap_tools();
    translate([-83/2, 0 , 0]) color("green") tap_holes();
}
translate([-83/2, 0 , 0]) color("green") tap_names();