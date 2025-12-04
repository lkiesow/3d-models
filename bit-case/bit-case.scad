
width  = 51.2;
depth  = 28.3;
height =  7.6;

bit_holder_d   =  7.6;
bit_holder_len = 42.4;

module case(h) {
  difference() {
    cube([width+4, depth+bit_holder_d+5, h]);
    color("red")
    translate([2, 2, 1]) {
      cube([width, depth, height]);
      translate([(width - bit_holder_len)/2, depth + 1, 0])
      cube([bit_holder_len, bit_holder_d, height]);
    }
  }
}

module rotate_outer(x) {
  color("blue")
  translate([x+1, depth + bit_holder_d + 2.2, (height-2)/4+1]) {
    difference() {
      translate([0, 0, (height-2)/2])
        rotate([0, 90, 0])
        cylinder(2, d=height-2, $fn=30, center=true);
      translate([0, 0, (height-2)/2])
        rotate([0, 90, 0])
        cylinder(8, d=1.4, $fn=10, center=true);
    }
    cube([2, height-2, (height-2)/2+2], center=true);
  }
}

module rotate_inner(x) {
  color("black")
  translate([x, depth+bit_holder_d+6.7-height, -0.001])
    cube([2.101, height-1.2, 20]);
  //translate([0, 0, (height-2)/2])
  translate([x+1, depth + bit_holder_d + 2.2, height-((height-2)/4+1 + (height-2)/2)])
    rotate([0, 90, 0])
    cylinder(12, d=1.3, $fn=10, center=true);
}

// case bottom
difference() {
  case(height);
  rotate_inner(0);
  rotate_inner(width+2-0.1);
}

// catch
difference() {
  color("black")
  translate([(width+4)/2 - 2.9, -2, height - (height-4.2)])
  cube([5.8, 3, height-4.2]);

  translate([(width+4)/2 - 5, -7, 4])
  rotate([-22, 0, 0])
  cube([10, 5, height]);
}

// case top
translate([width + 12, 0, 0]) {
  case(2);
  rotate_outer(0);
  rotate_outer(width+2);

  difference() {
    translate([(width+4)/2 - 6, -1, 0])
    cube([12, 1, height-1]);
    color("black")
    translate([(width+4)/2 - 3.1, -2, 0])
    cube([6.2, 6, height-1.8]);
  }
}
