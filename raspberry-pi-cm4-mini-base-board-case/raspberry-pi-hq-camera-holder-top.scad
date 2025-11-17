
module hole(x, y) {
    translate([x,y,2])
    cylinder(25, d=2.7, $fn=20);
}

module pin(x, y) {
    translate([x,y,0])
    cylinder(14, d=2.5, $fn=30);
}

module standoff(x, y) {
    translate([x,y,0])
    cylinder(17+3, d=6.2, $fn=30);
}

module rpi_base() {
    translate([1,1,1])
    minkowski(){
        sphere(d=2, $fn=25);
        cube([85-2, 62.4-2, 3-2]);
    }
}

difference() {
    union() {
        rpi_base();
        translate([0,0,1])
        union() {
            standoff(3.5, 6.7);
            standoff(3.5, 55.7);
            standoff(61.5, 6.7);
            standoff(61.5, 55.7);
        }
    }
    hole(3.5, 6.7);
    hole(3.5, 55.7);
    hole(61.5, 6.7);
    hole(61.5, 55.7);
}
