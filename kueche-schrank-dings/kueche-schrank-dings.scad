difference() {
    cube([20,  114.5, 10]);
    translate([9, -2, -1])
        cube([20,  20, 20]);
}
translate([0, 112, 0])
    cube([40.5,  2.5, 10]);
translate([38.5, 106.5, 0])
    cube([2,  8, 10]);
difference() {
    translate([-60, 54.5, 0])
        triangle(10);
    translate([-53, 51.5, -1])
        triangle(12);
}
module triangle(z) {
    difference() {
        cube([60, 60, z]);
        translate([0, -60, -1])
            rotate([0, 0, 45])
            cube([90, 90, z + 2]);
    }
}
