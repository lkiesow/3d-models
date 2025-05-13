difference() {
  union() {
    cube([201, 18, 3]);
    cube([201, 3, 15]);
    cube([16, 200, 3]);
    cube([1, 200, 15]);
    translate([0, 19, 0])
      cube([6, 181, 15]);
    translate([145, 0, 0])
      rotate([0, 0, 45])
      cube([15, 200, 3]);
  }
  translate([-40, 40, 7.5])
    rotate([0, 90, 0])
    cylinder(100, d=4, $fn=40);
  translate([-40, 160, 7.5])
    rotate([0, 90, 0])
    cylinder(100, d=4, $fn=40);
}
