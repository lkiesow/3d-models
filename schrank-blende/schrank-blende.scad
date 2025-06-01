x=300;
y=47;
z=65;

difference() {
    cube([x, y, z]);
    color("red")
        translate([5, 5, -5])
        cube([x-10, y-10, z+10]);
    color("red")
        translate([100, 5, -5])
        cube([100, y, z+10]);
}
