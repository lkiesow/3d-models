
screw_diameter=3.2;

module hole(x, y) {
    translate([x,y,-2])
    cylinder(25, d=screw_diameter, $fn=20);
}

module rpi_base() {
    translate([-2,1-8,1])
    minkowski(){
        sphere(d=2, $fn=25);
        cube([85, 62.4-2+16, 2]);
    }
}

difference() {
    rpi_base();
    hole(3.5, -3);
    hole(3.5, 55.7 + 9.7);
    hole(61.5, -3);
    hole(61.5, 55.7 + 9.7);
}
