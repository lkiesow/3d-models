width=45 + 0.4;
heigth=28.5 + 0.4;
length=10;
clamp=20;
thickness=2.6;

difference() {
    cube([width + 2 * thickness, heigth + 2 * thickness + 2, length]);

    // inner cutout
    translate([thickness, thickness + 2, -1])
        cube([width, heigth, 3+length]);

    // clamp cutout
    translate([thickness + clamp, 2 * thickness, -1])
        cube([width - 2 * clamp, 2 * heigth, 3+length]);

    screw(thickness + 8);
    screw(thickness + width - 8);
}

module screw(x_pos) {
    // left screw head
    translate([x_pos, 2, length / 2])
        rotate([-90, 0, 0])
        cylinder(40, d=6, $fn=25);

    // left screw hole
    translate([x_pos, -2, length / 2])
        rotate([-90, 0, 0])
        cylinder(20, d=2.5, $fn=25);
}
