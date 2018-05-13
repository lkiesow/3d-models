d=32;


module slate()
difference() {
    translate([-d/2-116, -1.5, 2])
        cube([d/2+116, 3, 14]);
    translate([-d/2-120, -2, 0])
        rotate([0, 6, 0])
        cube([d/2+116, 4, 14]);
}

rotate([180, 0, 0])
difference() {
    union() {
        // tobe clamp
        cylinder(16, d=d+2, $fn=150);
        // screw extension
        translate([0, -5, 0])
            cube([d/2+11, 10, 16]);
        // led module holder
        translate([0, 6, 0]) {
            translate([-d/2-116, -8, 13])
                cube([d/2+116, 16, 3]);
            slate();
        }
    }

    // screw hole
    translate([d/2+6, 0, 8])
        rotate([90,0,0])
        cylinder(30, d=4, center=true);
    // tube cutout
    translate([0, 0, -5])
        cylinder(30, d=d-1, $fn=150);
    // slit
    translate([0, -1, -5])
        cube([d/2+20, 2, 30]);
}
