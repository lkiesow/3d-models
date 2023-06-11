$fn=300;

module outer() {
    cylinder(40, d1=52, d2=86+3, center=true);
    translate([0, 0, -20])
        cylinder(8, d=52, center=true);
    translate([0, 0, 22])
        cylinder(4, d=86+3, center=true);
}

module inner() {
    color("red") {
        cylinder(40, d1=50, d2=86, center=true);
        translate([0, 0, -22])
            cylinder(8, d=50, center=true);
        translate([0, 0, 23])
            cylinder(6, d=86, center=true);
    }
}

rotate([180, 0, 0])
difference() {
    outer();
    inner();
}
