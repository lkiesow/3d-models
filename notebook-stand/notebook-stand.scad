depth  =  90;
width  = 160;
height =  50;

/*
module base() {
    difference() {
        union() {
            cube([width, depth, 4]);
            color("red")
                translate([0, 0, 3.8])
                rotate([-20, 0, 0])
                cube([width, 2, height]);
        }
        translate([20, 20, -1])
            cube([width-40, depth-40, 10]);
        for(i = [20:40:140]) {
            translate([i, 20, 15])
                rotate([40, 0, 0])
                cylinder(60, d=30);
        }
    }
}
*/

module base() {
    union() {
        cube([width, depth, 4]);
        color("red")
            translate([0, 0, 3.8])
            rotate([-20, 0, 0])
            cube([width, 2, height]);
    }
}

minkowski() {
    base();
    sphere(d=4, $fn=32);
}
