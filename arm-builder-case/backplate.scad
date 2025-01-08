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
}
