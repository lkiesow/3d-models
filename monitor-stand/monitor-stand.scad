cube([270, 6, 12]);

rotate([0, 0, 20])
translate([-17.5, -0.4, 0])
difference() {
  cube([20, 6, 12]);
  color("red")
  translate([6, 0, 6])
  rotate([90, 0, 0])
  cylinder(20, d=4.2, center=true);
}
