x=20.5;
y=2.5;
z=10;

difference() {
    minkowski() {
        cube([x+2, y+2, z], center=true);
        sphere(r=1, $fn=20);
    }

    cube([x, y, z+4], center=true);

    translate([3, -2, 0])
        rotate([0, 20, 0])
        cube([2, 4, z+4], center=true);
}
