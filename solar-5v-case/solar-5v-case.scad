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
  color("white")
  translate([76, 19/2 + wall, 10])
  cylinder(20 + wall, d=1.7, $fn=20);
}
