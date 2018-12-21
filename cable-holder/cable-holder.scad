module holder() {
    minkowski() {
        difference() {
            cube([85, 16, 25], center=true);
            cube([75, 12, 30], center=true);
            translate([15, -5, 0])
                rotate([0, 20, 0])
                cube([3.5, 10, 60], center=true);
        }
        sphere(1, $fn=20);
    }
}

module hole() {
    rotate([90,0,0])
        cylinder(30, d=6, $fn=30);
    rotate([-90,0,0])
        cylinder(30, d=3, $fn=30);
}

difference() {
    holder();
    translate([30,0,0])
        hole();
    translate([-30,0,0])
        hole();
}
for (y=[-5:10:5]) {
    for (x=[-20:10:20]) {
        translate([x, y, 0])
            sphere(3, $fn=30);
    }
}
