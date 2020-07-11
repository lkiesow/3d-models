
module hole(x, y) {
    translate([x,y,-2])
    cylinder(10, d=2.5, $fn=20);
}

module standoff(x, y) {
    translate([x,y,0])
    cylinder(6, d=6.2, $fn=30);
}

module rpi_base() {
    translate([1,1,1])
    minkowski(){
        sphere(d=2, $fn=25);
        cube([85-2, 56-2, 3-2]);
    }
}

// camera
// w/h 38mm
// hole 3.8mm
// h 3mm

module camera_holes(x, y) {
    dist = 38 - (2 * 3.8);
    translate([x,y,0])
    union() {
        hole(0,0);
        hole(0, dist);
        hole(dist, 0);
        hole(dist, dist);
    }
}

difference() {
    union() {
        rpi_base();
        standoff(3.5, 3.5);
        standoff(3.5, 52.5);
        standoff(61.5, 3.5);
        standoff(61.5, 52.5);
    }
    hole(3.5, 3.5);
    hole(3.5, 52.5);
    hole(61.5, 3.5);
    hole(61.5, 52.5);

    camera_holes(10, 10);
}
