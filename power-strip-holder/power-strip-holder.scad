width=70;
heigth=45;
length=15;
clamp=9;
thickness=2;

difference() {
    cube([width + 2 * thickness, heigth + 2 * thickness + 2, length]);

    // inner cutout
    translate([thickness, thickness + 2, -1])
        cube([width, heigth, 3+length]);

    // clamp cutout
    translate([thickness + clamp, 2 * thickness, -1])
        cube([width - 2 * clamp, 2 * heigth, 3+length]);

    screw(thickness + 4);
    screw(thickness + width - 4);
}

module screw(x_pos) {
    // left screw head
    translate([x_pos, 2, length / 2])
        rotate([-90, 0, 0])
        cylinder(20, d=5, $fn=25);

    // left screw hole
    translate([x_pos, -2, length / 2])
        rotate([-90, 0, 0])
        cylinder(20, d=2, $fn=25);
}
