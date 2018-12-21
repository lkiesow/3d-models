use <Scriber_Bold_Stencil.otf>
use <../opencast/logo.scad>

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
        translate([3,1.2,-1])
            cube([38,10,4.1]);
        //bottom
        hull() {
            translate([5,1.2,0])
                sphere(4);
            translate([5+34,1.2,0])
                sphere(4);
        }
        //left
        hull() {
            translate([3,10.2,0])
                sphere(4);
            translate([5,1.2,0])
                sphere(4);
        }
        //right
        hull() {
            translate([5+34+3,10.2,0])
                sphere(4);
            translate([5+34,1.2,0])
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

module schrift() {
	translate([30,-6,2.6])
		rotate([0,0,90])
			resize([12,0,0], auto=true)
				linear_extrude(10)
					text("lars", font = "Scriber Bold Stencil");
}

difference() {
    schale();
    holes();
	//schrift();
	translate([30,0,2.8]) rotate([0,0,180]) opencasticon(x=0, y=12);
    //translate([0,0,5.5])
    //    cube([100,100,10], center=true);
}


