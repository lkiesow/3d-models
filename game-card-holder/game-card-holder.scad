t=1;

difference() {
    cube([60+2*t, 17+2*t, 20], center=true);
    cube([60, 17, 20+2*t], center=true);
}