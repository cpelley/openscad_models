module capsule(){
    cylinder(d=15, h=40);
    scale([1, 1, 0.3]) sphere(d=15);
    translate([0, 0, 40]) scale([1, 1, 0.3]) sphere(d=15);
}


$fn=100;
difference(){
    capsule();
    scale([1, 1, 2]) translate([0, 0, -1]) sphere(d=10, $fn=20);
    translate([0, 0, -1]) cylinder(d=3, h=50, $fn=20);
}