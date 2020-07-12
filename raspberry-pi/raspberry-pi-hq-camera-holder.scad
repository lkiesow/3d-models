
module hole(x, y) {
    translate([x,y,-2])
    cylinder(16, d=2.5, $fn=20);
}

module standoff(x, y) {
    translate([x,y,0])
    cylinder(8, d=6.2, $fn=30);
}

module rpi_base() {
    translate([1,1,1])
    minkowski(){
        sphere(d=2, $fn=25);
        cube([85-2, 56-2, 4-2]);
    }
}

// camera
// w/h 38mm
// hole 3.8mm
// h 3mm

module camera_holes(x, y) {
    dist = 38 - (2 * 3.8);
    translate([x,y,-1])
    union() {
        difference() {
            union() {
                translate([-3.8,3.1,0])
                cube([38,dist-(2*3.1),5]);
                translate([3.1,-3.8,0])
                cube([dist-(2*3.1),38,5]);
                // round screwhole edges
                translate([dist/2,dist/2,0])
                rotate([0,0,45])
                cube([42,5,25], center=true);
                translate([dist/2,dist/2,0])
                rotate([0,0,-45])
                cube([42,5,25], center=true);
            }

            standoff(0,0);
            standoff(0,dist);
            standoff(dist,0);
            standoff(dist,dist);
        }
        hole(0,0);
        hole(0, dist);
        hole(dist, 0);
        hole(dist, dist);

        // ribbon cable
        cable_w = dist-(2*3.1);
        translate([-12,(dist+4-cable_w)/2-2,-1])
        cube([28,cable_w,8]);
    }
}

difference() {
    union() {
        rpi_base();
        translate([0,0,1])
        union() {
            standoff(3.5, 3.5);
            standoff(3.5, 52.5);
            standoff(61.5, 3.5);
            standoff(61.5, 52.5);
        }
    }
    hole(3.5, 3.5);
    hole(3.5, 52.5);
    hole(61.5, 3.5);
    hole(61.5, 52.5);

    camera_holes(10, 10);
}
