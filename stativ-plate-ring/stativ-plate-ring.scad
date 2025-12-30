outer  = 10;
inner  = 5.8;
height = 1.6;

difference() {
  cylinder(2, d=outer, $fn=40);
  cylinder(5, d=inner, $fn=20);
}
