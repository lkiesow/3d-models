//outer_x = 30;
//outer_y = 9;
outer_z = 50;

inner_x = 15.3;
inner_y = 3.8;

inner_battery_x = 40.5;
inner_battery_y = 11.4;

outer_x = inner_battery_x + 4;
outer_y = inner_battery_y + 2 + 9;

difference() {
    cube([outer_x, outer_y, outer_z], center=true);
    translate([0, -3.5, -1])
        cube([inner_battery_x, inner_battery_y, outer_z+3], center=true);
    translate([0, 7, 1])
        cube([inner_x, inner_y, outer_z], center=true);
}
