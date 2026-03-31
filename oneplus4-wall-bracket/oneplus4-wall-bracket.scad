width=74.5;
height=7.6;
thick=2;

top_clamp_from_bottom=112;
clamp_thickness=10;

for (y = [20, top_clamp_from_bottom]) {
  translate([0, y, 0])
    cube([width + 2 * thick, clamp_thickness, thick]);

  translate([0, y, 0])
    cube([thick, clamp_thickness, height + 2 * thick]);
  translate([0, y, height + thick])
    cube([4, clamp_thickness, thick]);

  translate([width + thick, y, 0])
    cube([thick, clamp_thickness, height + 2 * thick]);
  translate([width + 2 * thick - 4, y, height + thick])
    cube([4, clamp_thickness, thick]);
}

for (x = [15, width - 15 - clamp_thickness]) {
  translate([x, -thick, 0])
    cube([clamp_thickness, 130, thick]);
  translate([x, -thick, 0])
    cube([clamp_thickness, thick, height]);
}
