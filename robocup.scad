$fn = 100;

h = 70;
1k_stand_r = 35;


difference() {
    cylinder(r=1k_stand_r + 10, h=h, center=true);
    cylinder(r=1k_stand_r, h=h, center=true);
    translate([-5, 0, -h/2]) {
        cube([10, 1k_stand_r * 2, h]);
    }
}

translate([-5, 1k_stand_r, 0]) {
    cube([10, 10, 10]);
}



