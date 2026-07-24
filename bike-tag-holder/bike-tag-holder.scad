d = 32.5;
h = 9;
screw_d = 6.1;

difference() {
    union() {
        cylinder(h+2, d=d+6);
        translate([0, -24, 0])
            cylinder(2.5, d=20);
        for (i = [-18, 18]) {
            translate([i, 0, 0])
                cylinder(h+2, d=6, $fn=16);
        }
    }
    translate([0, 0, -1])
        cylinder(h+6, d=d);
    // screw holes for top bar
    for (i = [-18, 18]) {
        color("red")
        translate([i, 0, 1])
            cylinder(h+2, d=2.2, $fn=32);
    }
    // big screw hole
    color("red")
    translate([0, -26, -1])
        cylinder(10, d=screw_d, $fn=16);
}
translate([0, 0, .75])
    cube([d, 10, 1.5], center=true);

// top bar
translate([0, 30, 0])
difference() {
    union() {
        intersection() {
            cylinder(h+2, d=d+6);
            translate([0, 0, .75])
                cube([2*d, 10, 1.5], center=true);
        }
        for (i = [-18, 18]) {
            translate([i, 0, 0])
                cylinder(1.5, d=6, $fn=32);
        }
    }
    // screw holes
    for (i = [-18, 18]) {
        color("red")
        translate([i, 0, 1])
            cylinder(h+2, d=2.3, $fn=32);
    }
}
