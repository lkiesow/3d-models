d=25+0.6;

difference() {
    cube([d+6, d+6, 20]);
    translate([3,3,-1])
        cube([d, d, 30]);
}

translate([0, -2.5*d, 0])
    cube([5, 2.5*d, 20]);

difference() {
    translate([d*2, -d*2.5, 0])
        cylinder(20, d=d*4, $fn=50);

    translate([d*2, -d*2.5, -1])
        cylinder(30, d=d*4-12, $fn=50);

    translate([0, -4.5*d, -1])
        cube([4*d, 2*d, 30]);

    translate([30, -4*d, -1])
        cube([4*d, 4*d, 30]);

    translate([3*d, -2*d, -1])
        rotate([0,0,60])
        cube([4*d, 4*d, 30]);
}

intersection() {
    translate([-d*2+30.5, -16, 7])
        cylinder(6, d=d*4-12, $fn=50);
    translate([d*2, -d*2.5, 0])
        cylinder(20, d=d*4, $fn=50);
}
