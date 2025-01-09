use <rj45_keystone_receiver.scad>;

color("red")
rotate([180, 0, 0])
    translate([100, -30, -9.9])
    rj45Receiver();

module backplate() {
    cube([425, 40, 2.8]);
    translate([2, 2, 0])
        cube([421, 36, 3.8]);
}

module power() {
    cube([27, 33, 1]);
    translate([-1, -1, 1])
        cube([29, 35, 10]);
}

module switch() {
    cube([22, 20.6, 1]);
    translate([-1, -1, 1])
        cube([24, 22.6, 10]);
}

difference() {
    backplate();

    // keystone
    translate([100, 4.1, -0.001])
        rj45VolumeBlock();

    translate([350, 3.5, -0.001])
        power();

    translate([300, 9, -0.001])
        switch();

    translate([160, 20, -0.001])
        fan_holes();
}

module fan_holes() {
    for (i = [-16, 16], j = [-16, 16]) {
        translate([i, j, 0])
            cylinder(10, d=3.5, $fn=15);
    }

    for (i = [0:4:360]) {
        if (i % 90 > 24)
            rotate([0, 0, i])
            translate([16, 0, 0])
            cylinder(10, d=6, $fn=15);
        if (i % 90 > 44)
            rotate([0, 0, i])
            translate([8, 0, 0])
            cylinder(10, d=6, $fn=15);
    }

    cylinder(10, d=6, $fn=15);
}

module fan_plate() {
    for (i = [-17, 17], j = [-17, 17]) {
        translate([i, j, 0])
            cylinder(2, d=6, $fn=15);
    }
    translate([0, 0, 1])
        cube([40, 34, 2], center=true);
    translate([0, 0, 1])
        cube([34, 40, 2], center=true);
}

module fan_grill() {
    difference() {
        fan_plate();
        translate([0, 0, -0.001])
            fan_holes();
    }
}


//fan_grill();
