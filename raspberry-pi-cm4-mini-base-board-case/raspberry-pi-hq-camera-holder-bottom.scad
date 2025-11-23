
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
    cylinder(7, d=6.2, $fn=30);
}

module top_mount(x, y) {
  // board height is < 23 mm
  difference() {
    translate([x,y,0])
    cylinder(30, d=6.2, $fn=30);
    color("red")
    translate([x,y,6])
    cylinder(30, d=3.2, $fn=30);
  }
}

module rpi_base() {
    translate([1,1-8,1])
    minkowski(){
        sphere(d=2, $fn=25);
        difference() {
          cube([85-2, 62.4-2+16, 3-2]);
          translate([(30-2)/2,(40-2)/2,-1])
            cube([62.4+16-40, 62.4+16-40, 5]);
        }
    }

}

module vesa_mount() {
    mount_dimension = 100;
    translate([-(mount_dimension+8 - 85) / 2, -(mount_dimension+8 - 62.4) / 2, 0])
    for (x = [0, mount_dimension]) {
      // inner bars
      difference() {
        translate([1+3, mount_dimension/2 + (x+1)/2 - mount_dimension/4 + 1, 1])
        minkowski(){
          sphere(d=2, $fn=25);
          cube([mount_dimension, 6, 3-2]);
        }
      }

      // outer mount bars
      difference() {
        translate([x+1,1,1])
        minkowski(){
          sphere(d=2, $fn=25);
          if (x <= 0)  {
            shortened_length = mount_dimension+8-2 - (mount_dimension+8 - 62.4) / 2;
            cube([8-2, shortened_length, 4-2]);
          } else {
            cube([8-2, mount_dimension+8-2, 4-2]);
          }
        }
        for (y = [0, mount_dimension]) {
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
    hole(3.5, 6.7);
    hole(3.5, 55.7);
    hole(61.5, 6.7);
    hole(61.5, 55.7);
}

vesa_mount();

top_mount(3.5, -3);
top_mount(3.5, 55.7 + 9.7);
top_mount(61.5, -3);
top_mount(61.5, 55.7 + 9.7);
