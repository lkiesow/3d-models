
len = 46;
d   = 14;

screw_len = 16;
screw_d   = 2.8;

difference() {
  cylinder(len, d=d, $fn=40, center=true);

  // screw hole
  color("red")
  translate([0, 0, len - screw_len])
  cylinder(len, d=screw_d, $fn=20, center=true);

  // wire cutout
  color("red")
  for (i = [-1, +1]) {
    translate([0, i*d/2, 0])
    cube([8, 8, 2*len], center=true);
  }
}
