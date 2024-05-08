outer_x = 30;
outer_y = 8;
outer_z = 50;

inner_x = 15.3;
inner_y = 3.8;

difference() {
    cube([outer_x, outer_y, outer_z], center=true);
    translate([0, 0, 1])
        cube([inner_x, inner_y, outer_z], center=true);
}
