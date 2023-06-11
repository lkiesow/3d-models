OUT=61;
IN=59;
H=7;

module sled() {
    // holder
    cylinder(H, d=OUT, center=true, $fn=150);
    intersection() {
        // rectangular towards the front
        translate([0, -OUT/2, 0])
            cube([OUT, OUT, H], center=true);
        // round front
        translate([0, 3, -1])
            minkowski() {
                cylinder(H-4, d=91-6, center=true, $fn=150);
                sphere(d=6, $fn=50);
            }
    }
}

difference() {
    intersection() {
        sled();
        // round bottom enges of sled
        // except for front
        scale([0.94, 1, 1])
            translate([0, -2, 2])
                minkowski() {
                    sled();
                    sphere(d=4, $fn=50);
                }
    }
    // cur out glass holder
    translate([0, 0, H-1])
        cylinder(H, d=IN, center=true, $fn=150);
}
