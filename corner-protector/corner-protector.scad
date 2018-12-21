difference() {
    minkowski() {
        union() {
            cube([7,7,60]);
            cube([7,60,7]);
            cube([60,7,7]);

            intersection() {
                union() {
                    rotate([-90,0,0])
                    cylinder(2, r=30, $fn=75);
                    rotate([0,90,0])
                    cylinder(2, r=30, $fn=75);
                }
                cube([42,42,42]);
            }
        }
        sphere(1, $fn=20);
    }

    translate([2,2,2])
        cube([99,99,99]);

    // holes
    /*
    translate([0,28,28])
    rotate([0,90,0])
    cylinder(20, d=1.5, center=true, $fn=20);
    translate([28,0,28])
    rotate([90,0,0])
    cylinder(20, d=1.5, center=true, $fn=20);
    */
}
