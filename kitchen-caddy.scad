$fn = 200;

plate_x = 250;
plate_y = 150;
plate_z = 6;
leg_r = 5;
leg_h = 200;
leg_margin = 15;
hole_x = plate_x * 2 / 3;
hole_y = 5;
support_rod_r = 2.6 / 2;

foot_h = 30;


hole_count = ((plate_y - leg_margin * 4) / hole_y) / 2 + 1;
difference() {
    cube([plate_x, plate_y, plate_z]);
    translate([plate_x / 6, leg_margin * 2, 0]) {
        for (i=[0:hole_count-1]) {
            translate([0, hole_y * 2 * i, 0]) cube([hole_x, hole_y, plate_z]);
        }
    }
}

module leg() {
    color("blue") {
        difference() {
            union() {
                cylinder(r=leg_r, h=leg_h);
                cylinder(r1=leg_r*3, r2=leg_r, h=foot_h);
                translate([0, 0, leg_h - foot_h]) cylinder(r1=leg_r, r2=leg_r*3, h=foot_h);
            }
            cylinder(r=support_rod_r, h=leg_h*2);
        }
        
       
    }
}

for (i=[0,1]) {
    for (j=[0,1]) {
        translate([i*(plate_x - 2* leg_margin) + leg_margin, j*(plate_y - 2* leg_margin) + leg_margin, 0]) {
            leg();
        }
    }
}
