
plate_height = 44.45 - 0.79; // 1 rack unit - 0.79mm
plate_width = 18 * 25.4 - 14.7; // 18 inches - 14.7mm
// plate_width = 6 * 25.4; // 6 inches <- tiny for prototype
plate_depth = 16;

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
      if (i > 60) {
        translate([i, 9, -2])
          rotate([0, 0, i])
          cylinder(20, d=hole_d, $fn=8);
      }
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
color("black")
translate([0, 11, 0])
  cube([6, 14, 9]);
color("red")
translate([-1, 11, 7])
  cube([6, 20, 3]);
color("blue")
translate([-3, 14, 5.5])
  rotate([0, 90, 0])
  cylinder(4, d=2.5, $fn=16);
// left edge
translate([0, -1, 0])
  cube([6, 7.5, 15]);
// right edge
//translate([0, plate_height-1-7.5, 0])
//  cube([6, 7.5, 15]);
// bottom
translate([0, 0, -1])
  cube([6, plate_height-2, 3.6]);

// right locking mechanism
// IMPORTANT: Remember that the front plate sits at z=-1
color("black")
translate([plate_width-16, 19, -1+3.6+4])
  cube([15, 12, 3]);
color("red")
translate([plate_width-16, 19, 0]) // 5mm zurück
  cube([10, 12, 7]);
// left edge
translate([plate_width-6-2, -1, 0])
  cube([6, 7.5, 15]);
// right edge
translate([plate_width-6-2, plate_height-1-7.5, 0])
  cube([6, 7.5, 15]);
// bottom
translate([plate_width-6-2, 0, -1])
  cube([6, plate_height-2, 3.6]);
