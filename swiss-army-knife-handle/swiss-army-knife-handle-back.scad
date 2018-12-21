
module holes() {
    dloch=6.5;
    translate([-3.5,6,-1])
        cylinder(2.5, d=3.5, $fn=25);
    translate([-12.5,2.5,-1])
        cylinder(3.5, d=dloch, $fn=25);
    translate([-37,-1,-1])
        cylinder(3.5, d=dloch, $fn=25);
    translate([38,-2.5,-1])
        cylinder(3.5, d=dloch, $fn=25);
}

module cutaway() {
    difference() {
        $fn=100;
        translate([3,0.2,-1])
            cube([38,20,4.1]);
        //bottom
        hull() {
            translate([2,0.2,0])
                sphere(4);
            translate([5+34,0.2,0])
                sphere(4);
        }
        //left
        hull() {
            translate([0,10.2,0])
                sphere(4);
            translate([2,0.2,0])
                sphere(4);
        }
        //right
        hull() {
            translate([6+34+4,10.2,0])
                sphere(4);
            translate([6+34,0.2,0])
                sphere(4);
        }
    }
}

module schale() {
    difference() {
        union() {
            hull() {
                translate([-90.5/2+9,0,0]) {
                    minkowski() {
                        $fn=50;
                        cylinder(0.001, r=9-3);
                        sphere(3);
                    }
                }
                minkowski() {
                    $fn=50;
                    cylinder(0.001, r=10.2-3);
                    sphere(3);
                }
            }

            hull() {
                minkowski() {
                    $fn=50;
                    cylinder(0.001, r=10.2-3);
                    sphere(3);
                }
                translate([91.5/2-10,0,0]) {
                    minkowski() {
                        $fn=50;
                        cylinder(0.001, r=10-3);
                        sphere(3);
                    }
                }
            }
        }
        translate([0,0,-5])
        cube([100,100,10], center=true);
    }
}

mirror([1,0,0])
difference() {
    schale();
    holes();
    cutaway();
    //translate([0,0,5.5])
    //    cube([100,100,10], center=true);
}
