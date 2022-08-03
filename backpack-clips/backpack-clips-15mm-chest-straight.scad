x=15 + 1.0;
y=2.5 + 0.3;
z=10;

difference() {
    // body
    minkowski() {
        cube([x+2, y+2, z], center=true);
        sphere(r=1, $fn=20);
    }

    // inner hole
    cube([x, y, z+4], center=true);

    // opening
    translate([7, -2, 0])
        cube([2, 4, z+4], center=true);
}
