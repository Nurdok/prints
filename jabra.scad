$fn = 100;

module half_sphere(r) {
        difference() {
            sphere(r=r);
            translate([-r, -r, 0]) cube([r*2, r*2, 30]);
        }
        
}

module pill(r, d) {
    hull() {
        half_sphere(r);
        translate([0, 0, d]) rotate([180, 0, 0]) half_sphere(r);
    }
}


module jabra() {
    x = 32;
    y = 26;
    straight_part_len = 35;
    
    //sr = sqrt(pow(x,2)+pow(y,2))/2;
    sr =21;
    
    translate([0, 0, sr]) {
    difference() {
        pill(sr, straight_part_len);
        translate([-x, y/2, -sr]) cube([2*x, 30, 100]);
        translate([-x, -y/2 -30 ,-sr]) cube([2*x, 30, 100]);
    }
}
}

//jabra();
