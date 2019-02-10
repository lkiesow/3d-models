t=25.1;

rotate([90,0,0])
difference() {
    cube([t+14,14,t+3]);

    // pole cutout
    translate([2,-2,-1])
        cube([t,2*14,t+1]);

    // pole cutout
    translate([-2,-2,-4])
        cube([t,2*14,t]);

    // screw hole
    translate([t+2+6,7,-1])
        cylinder(2*t, d=4, $fn=25);

    // sloped edge
    translate([t+14,-1,-5])
        rotate([0,-15,0])
        cube([20, 20, 2*t]);

    // screw cutout
    translate([t+9,2,5])
        cube([10,10,2*t]);
    translate([t+2+7,7,5])
        cylinder(2*t, d=10, $fn=30);
}
