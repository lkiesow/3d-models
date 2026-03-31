//intersection() {
difference() {
    minkowski() {
        difference() {
            cube([70-2, 61.5-2, 150]);
            color("red")
            cube([27, 7.4, 200]);
        }
        sphere(d=2, $fn=20);
    }
    // center
    color("orange")
    translate([4, 13, -1])
    cube([60, 40, 200]);

    // make top/bottom flat
    color("red")
    translate([-5, -5, -10])
    cube([90, 90, 10]);
    color("red")
    translate([-5, -5, 150])
    cube([90, 90, 10]);

    // conector holes
    $fn=12;
    d=2.56;
    color("black")
    translate([34, 7, 130])
    cylinder(40, d=d);
    color("black")
    translate([60, 7, 130])
    cylinder(40, d=d);
    color("black")
    translate([34, 7, -20])
    cylinder(40, d=d);
    color("black")
    translate([60, 7, -20])
    cylinder(40, d=d);
}

//translate([-10, -10, 0])
//cube([90, 90, 20]);
//}
