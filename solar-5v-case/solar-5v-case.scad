wall = 2;

difference() {
  cube([90, 19 + 2*wall, 20 + 2*wall]);

  // general cutout
  translate([wall, wall, wall])
  cube([90 - 2*wall, 19, 30]);

  // USB
  translate([-1, wall+2, wall+4])
  cube([30, 19-4, 30]);

  // cabke hole
  color("red")
  hull()
  for (y = [-3, +3]) {
    translate([76, 19/2 + wall + y, 8])
    rotate([0, 90, 0])
    cylinder(20, d=6.3, $fn=20);
  }
}

// screw mount
difference() {
  color("red")
  translate([76, 19/2 + wall, 0])
  cylinder(20 + wall, d=5.5, $fn=20);
  // screw hole
  color("white")
  translate([76, 19/2 + wall, 10])
  cylinder(20 + wall, d=1.7, $fn=20);
}

// top
translate([0, -30, 0]) {
  difference() {
    union() {
      cube([90, 19 + 2*wall, 1]);

      difference() {
        // inner top
        translate([wall, wall, 1])
        cube([90 - 2*wall, 19, wall]);

        // inner top cutout
        translate([2*wall, 2*wall, 1])
        cube([90 - 4*wall, 19-2*wall, 10]);
      }

      // USB
      translate([0, wall+2, 0])
      cube([2*wall, 19-4, 1 + wall + 1]);

      translate([76, 19/2 + wall, 0])
      cylinder(0.9 + wall, d=5.5, $fn=20);
    }

    // screw hole
    translate([76, 19/2 + wall, -1])
    cylinder(20 + wall, d=1.7, $fn=20);

    // ventilation holes
    for (x = [0:4:48], y = [0:4:12]) {
      color("white")
      translate([16+x, 4.5+y, -1])
      cube([2, 2, 10]);
    }
  }
}
