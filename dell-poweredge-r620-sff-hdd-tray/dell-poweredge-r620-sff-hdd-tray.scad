difference() {
    import("Dell_PowerEdge_R610_R710_SFF_HDD_tray.stl");

    // left
    color("red")
    translate([30.5, -61.4, 3])
    rotate([90, 0, 0])
    cylinder(10, d=6.2, center=true, $fn=60);

    color("red")
    translate([-46.1, -61.4, 3])
    rotate([90, 0, 0])
    cylinder(10, d=6.2, center=true, $fn=60);

    // right
    color("red")
    translate([30.5, 20.8, 3])
    rotate([90, 0, 0])
    cylinder(10, d=6.2, center=true, $fn=60);

    color("red")
    translate([-46.1, -20.8, 3])
    rotate([90, 0, 0])
    cylinder(10, d=6.2, center=true, $fn=60);
}
