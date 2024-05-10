d=9;

module clamp() {
    difference() {
        cube([6, 9+4, 10]);
        translate([-1, 2, 2])
            cube([8, 9, 10]);
    }
    translate([2.7, 0, 0])
        cube([0.6, 2.6, 10]);
    translate([2.7, 10.4, 0])
        cube([0.6, 2.6, 10]);
}

translate([0, 3, 0])
    cube([200, 7, 2]);
clamp();
translate([100, 0, 0])
    clamp();
translate([200, 0, 0])
    clamp();
