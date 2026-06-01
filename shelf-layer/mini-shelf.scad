w=337;
d=82;
h=8; // 15

cube([w, d, 3]);
for (x = [0:(w-2)/5:w]) {
  color("red")
  translate([x, 0, 0])
  cube([2, d, h]);
}
for (y = [0:(d-2)/3:d]) {
  color("red")
  translate([0, y, 0])
  cube([w, 2, h]);
}
for (x = [0:w-6:w]) {
  for (y = [0:d-6:d]) {
    color("orange")
    translate([x, y, 0])
    cube([6, 6, d]);
  }
}
for (x = [0:w-2:w]) {
    translate([x, 0, 5])
      rotate([-50, 0, 0])
      cube([2, 6, d+20]);
    mirror([0,1,0])
      translate([x, -d, 5])
      rotate([-50, 0, 0])
      cube([2, 6, d+20]);
}
