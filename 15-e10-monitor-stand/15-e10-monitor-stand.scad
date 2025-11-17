rotate([90, 0, 0])
union() {
    cube([250, 16, 5]);

    difference() {
        color("red")
            rotate([0, 20, 0])
            translate([-20, 0, 0])
            cube([20, 16, 5]);

        rotate([0, 20, 0])
            translate([-10, 8, -10])
            cylinder(30, d=4.2, $fn=30);
    }
}
