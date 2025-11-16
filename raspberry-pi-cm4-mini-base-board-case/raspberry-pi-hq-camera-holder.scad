
module hole(x, y) {
    translate([x,y,-2])
    cylinder(16, d=2.5, $fn=20);
}

module pin(x, y) {
    translate([x,y,0])
    cylinder(14, d=2.5, $fn=30);
}

module standoff(x, y) {
    translate([x,y,0])
    cylinder(8, d=6.2, $fn=30);
}

module rpi_base() {
    translate([1,1,1])
    minkowski(){
        sphere(d=2, $fn=25);
        cube([85-2, 62.4-2, 3-2]);
    }
}

module vesa_mount() {
    translate([0, -(75+8 - 62.4) / 2, 0])
    for (x = [0, 75]) {
      difference() {
        translate([x+1,1,1])
        minkowski(){
          sphere(d=2, $fn=25);
          cube([8-2, 75+8-2, 4-2]);
        }
        for (y = [0, 75]) {
          translate([4+x, 4+y, -1])
          cylinder(20, d=4.2, $fn=30);
        }
      }
    }
}


difference() {
    union() {
        rpi_base();
        translate([0,0,1])
        union() {
            standoff(3.5, 6.7);
            standoff(3.5, 55.7);
            standoff(61.5, 6.7);
            standoff(61.5, 55.7);
        }
    }
}
pin(3.5, 6.7);
pin(3.5, 55.7);
pin(61.5, 6.7);
pin(61.5, 55.7);

vesa_mount();
