in=22.2;
out=25;

difference() {
    minkowski() {
        translate([0,0,2])
            cube([out-2, out-2, 2], center=true);
        sphere(1, $fn=25);
    }
    translate([0,0,5])
        cube([out, out, 4], center=true);
}

difference() {
    union() {
        translate([0, 0, 9])
            cube([in-2, in-2, 18], center=true);

        for (i = [2:9]) {
            translate([0, 0, 2*i])
                cube([in,   in-2, .6], center=true);
            translate([0, 0, 2*i])
                cube([in-2, in,   .6], center=true);
        }
    }
    cube([in-5, in-5, 60], center=true);
}
