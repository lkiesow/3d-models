
plate_height = 44.45; // 1 rack unit
plate_width = 18 * 25.4; // 18 inches
plate_depth = 10;

module plate() {
  rounding = 2;
  difference() {
    // front plate
    minkowski() {
      cube([plate_width-rounding, plate_height-rounding, 3-rounding]);
      sphere(d=rounding, $fn=20);
    }

    // holes in the front plate
    hole_d = 13;
    color("red")
    for (i = [24:hole_d+2:plate_width-20]) {
      translate([i, 9, -2])
        rotate([0, 0, i])
        cylinder(20, d=hole_d, $fn=8);
      translate([i - (hole_d / 2), 21, -2])
        rotate([0, 0, i+(hole_d+2)/3])
        cylinder(20, d=hole_d, $fn=8);
      translate([i, 33, -2])
        rotate([0, 0, i+(hole_d+2)/3*2])
        cylinder(20, d=hole_d, $fn=8);
    }
    // add an additional hole at the right end of the middle row
    translate([24 + (hole_d+2) * 28 - (hole_d / 2), 21, -2])
      cylinder(20, d=hole_d, $fn=8);
  }
  translate([0, -1, 0])
    cube([plate_width-rounding, 3, plate_depth-1]);
  translate([0, plate_height-3-1, 0])
    cube([plate_width-rounding, 3, plate_depth-1]);
}

plate();

// left locking mechanism
// IMPORTANT: Remember that the front plate sits at z=-1
translate([-1, 12, 0])
  cube([6, 22, 7]);
translate([-1, 8, 4])
  cube([6, 22, 3]);
color("blue")
translate([-3, 32, 5])
  rotate([0, 90, 0])
  cylinder(4, d=3, $fn=16);

// right locking mechanism
// IMPORTANT: Remember that the front plate sits at z=-1
translate([plate_width-12, 12, 4])
  cube([12, 22, 3]);
translate([plate_width-12, 12, 0])
  cube([6, 22, 7]);
