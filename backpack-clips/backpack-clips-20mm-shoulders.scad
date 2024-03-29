x=20.5 + 0.7;
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
    translate([3, -3, 0])
        rotate([0, 20, 21])
        cube([3, 6.5, z+10], center=true);
    translate([3, -3, 0])
        rotate([0, 20, -10])
        cube([3, 6, z+10], center=true);
}
