module corner() {
    difference() {
        color("blue")
        translate([-68, -63, -2])
            cylinder(4, d=25, $fn=50);

        hull() {
            translate([-63, -58, -3])
                cylinder(6, d=10, $fn=50);
            translate([-53, -58, -3])
                cylinder(6, d=10, $fn=50);
            translate([-63, -48, -3])
                cylinder(6, d=10, $fn=50);
        }
    }
}

module screw_hole() {
    cylinder(10, d=3.1, $fn=40);
    translate([0, 0, 7.5])
        sphere(d=5, $fn=50);
}

difference() {
    cube([136, 126, 3], center=true);

    // rounded corners
    corner();
    mirror([1, 0, 0])
        corner();
    mirror([0, 1, 0])
        corner();
    mirror([1, 0, 0])
    mirror([0, 1, 0])
        corner();

    // screw holes
    translate([-65, -52, -5])
        screw_hole();
    translate([65, -52, -5])
        screw_hole();
    translate([-65, 52, -5])
        screw_hole();
    translate([65, 52, -5])
        screw_hole();

    // ventilation
    for (x = [-27, 27], y = [-50:5:50]) {
        translate([x, y, 0]) {
            cube([45, 3, 6], center=true);
        }
    }

    // lower vents
    for (x = [-27, 27]) {
        translate([x, 0 , 3.5])
            cube([45, 100, 6], center=true);
    }
}
