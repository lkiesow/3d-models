x=400;
y=45;
z=49;

difference() {
    cube([x, y, z]);
    color("red")
        translate([5, 5, -5])
        cube([x-10, y-10, z+10]);
    color("red")
        translate([100, 5, -5])
        cube([x-200, y, z+10]);

  color("blue")
  translate([3.3, y/3*2, z-10])
  rotate([0, 30, 0]) {
    cylinder(30, d=3.1, $fn=25, center=true);
    cylinder(15, d=6, $fn=35, center=false);
  }

  color("blue")
  translate([3.2, y/3, 10])
  rotate([0, 150, 0]) {
    cylinder(30, d=3.1, $fn=25, center=true);
    cylinder(15, d=6, $fn=35, center=false);
  }
}
