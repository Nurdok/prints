$fn = 100;

module roundedcube(xdim, ydim, zdim, rdim) {
  hull(){
    translate([rdim,rdim,0]) cylinder(h=zdim,r=rdim);
    translate([xdim-rdim,rdim,0]) cylinder(h=zdim,r=rdim);
    translate([rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim);
    translate([xdim-rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim);
  }
}

ps_x = 235;
ps_y = 52;
ps_z = 31;
rim = 10;
corner_r = 5;

module powerstrip_slot() {
    difference() {
        roundedcube(ps_x + rim, ps_y + 2 * rim, ps_z / 2 + rim, corner_r);
        translate([-corner_r, rim, rim]) roundedcube(ps_x + corner_r, ps_y, ps_z, corner_r);
    }
}

module slanted_base(slant_size, width) {
    x = slant_size / sqrt(2);
    difference() {
        cube([width, x, x]);
        rotate([45, 0, 0]) cube([width, 2*x, 2*x]);
    }

    
}

module main() {
    translate([rim / 2, 0, 0]) slanted_base(slant_size=ps_y, width=ps_x);
    rotate([45, 0, 0]) powerstrip_slot();
}

main();