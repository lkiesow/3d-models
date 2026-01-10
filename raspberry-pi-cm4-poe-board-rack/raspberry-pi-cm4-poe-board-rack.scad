// Compute Module 4 POE Board
//
// Docsumentation
// https://www.waveshare.com/wiki/Compute_Module_4_POE_Board

width = 160 + .4; // added .4 for easier fit
depth = 89.8;

standoff_height = 6;
standoff_screw = 2.96;

rack_case_holes_inner = 120.4;
rack_case_holes_edge = 41.4;
rack_case_holes_d = 7.2;
rack_case_holes_dist = rack_case_holes_inner + rack_case_holes_d;

module standoff(x, y) {
  difference() {
    $fn = 30;
    color("red")
    translate([x, y, 0])
      cylinder(standoff_height, d=standoff_screw + 2.5);
    translate([x, y, -1])
      cylinder(standoff_height + 3, d=standoff_screw);
  }
}

difference() {
  // board
  cube([width, depth, 1]);
  // board cutout
  color("red")
  translate([25, 20, -1])
  cube([width-50, depth, 4]);

  // cutouts for standoff in rack case
  color("black")
  translate([(width - rack_case_holes_dist)/2, rack_case_holes_edge, -1])
    cylinder(6, d=rack_case_holes_d + 4);
  color("black")
  translate([(width - rack_case_holes_dist)/2 + rack_case_holes_dist, rack_case_holes_edge, -1])
    cylinder(6, d=rack_case_holes_d + 4);
}

// front left screw
standoff(11.4, 8.4);
// back left screw
standoff(11.4, 8.4 + 69);
// front right screw
standoff(11.4 + 134, 8.4);
// back right screw
standoff(11.4 + 134, 8.4 + 69);

// IO plate
difference(){
  translate([-20, 0, 0])
    cube([width + 40, 2, 30]);
  translate([0, -2, standoff_height])
    cube([width, 8, 19]);

  // screw holes
  translate([-10, 0, 16])
    rotate([90, 0, 0])
    cylinder(8, d=3, center=true);
  translate([10 + width, 0, 16])
    rotate([90, 0, 0])
    cylinder(8, d=3, center=true);
}
translate([-3, 0, 0])
cube([3, 20, 20]);
translate([width, 0, 0])
cube([3, 20, 20]);
