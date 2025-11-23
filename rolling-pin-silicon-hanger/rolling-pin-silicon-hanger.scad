w = 36.4;

difference() {
  cube([w + 11 + 60, 40, 20]);

  // left cutout
  translate([4, -3, -1])
  cube([w, 40, 24]);

  // right cutout
  translate([w + 8, 4, -1])
  cube([60, 40, 24]);

  // shorten rightmost part of the hook
  translate([w + 60, 25, -1])
  cube([20, 40, 24]);
}
