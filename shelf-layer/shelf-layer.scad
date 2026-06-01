w=337;
d=132;
h=8; // 15

cube([w, d, 3]);
for (y = [0:(d-2)/3:d]) {
  color("red")
  translate([0, y, 0])
  cube([w, 2, h]);
}
for (x = [0:(w-2)/5:w]) {
  color("red")
  translate([x, 0, 0])
  cube([2, d, h]);
}
