
difference() {
    linear_extrude(20)
        polygon([
            [0,1], [40,0], [40,-22], [3,-22],
            [3, -19], [5,-19], [5,-17], [0,-17],
            [0,-24], [43,-26.5], [43,3], [0,3]
            ]);
    hole(30);
    hole(15);
}


module hole(x) {
    translate([x,1.5,10])
    rotate([90,0,0])
    union(){
        $fn=150;
        cylinder(30, d=7.4);
        translate([0,0,-6])
            cylinder(30, d=3);
    }
}
