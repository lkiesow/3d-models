w1 = 45;
w2 = 76;
w3 = 91;

h1 = 24.5;
h2 = 49.5;
h3 = 69;

d = 19;

module shelly() {
  translate([(w3-w1)/2, 0, 0])
    cube([w1, h3, d]);
  translate([(w3-w2)/2, 0, 0])
    cube([w2, h2, d]);
  cube([w3, h1, d]);
}

module screw_hole(x, y) {
  translate([x, y, 0])
  difference() {
    cube([10, 10, d+2*2 + 4]);
    translate([5, 5, 2])
      cylinder(50, d=3, $fn=20);
  }
}

module case() {
  difference() {
    cube([w3+60, h3+3, d+2*2 + 4]);

    translate([3, 3, 2])
    cube([w3+54, h3-3, d+2*2 + 4]);

    translate([(w3-w1)/2+30, 3.1, 2])
      cube([w1, h3, d+10]);
  }

  screw_hole(0, 0);
  screw_hole(w3 + 60 - 10, 0);
  screw_hole(0, h3 - 7);
  screw_hole(w3 + 60 - 10, h3 - 7);
}

module lan_port() {
  translate([w2 + 30, h1 + 2, 0])
  difference() {
    cube([45, 18, 13.5 + 3.001]);
    color("green")
    translate([0, 2, -0.001])
    cube([50, 14, 20]);
  }
}

module lan_cutout() {
  translate([w2 + (w3-w2)/2 + 30, h1 + 2, 0])
    translate([0, 2, -0.001])
      cube([50, 14, 30]);
}

module power_cord_hole(x, y) {
  translate([x, y, 15])
  color("black") {
    rotate([0, 90, 0])
    cylinder(20, d=7, center=true);
    translate([0, 0, 15])
    cube([20, 7, 30], center=true);
  }
}

difference() {
  union() {
    case();
    lan_port();

    // left stopper top
    translate([30 + (w3-w1)/2 - 4, h3 - 16 + 3, 0])
    cube([6, 16, 12]);

    // left stopper bottom
    translate([30 - 4, 0, 0])
    cube([6, 6, 12]);
  }
  lan_cutout();

  // output
  power_cord_hole(0, 20);
  power_cord_hole(0, 40);

  // input
  power_cord_hole(w3 + 60, 18);

  color("red")
  translate([30, 3.001, 2])
  shelly();
}
