$fn=100;

translate([0, -3, 0])
difference(){
    rotate([90]) cylinder(d=27, h=12);
    translate([0, 0, 25]) cube([50, 50, 50], center=true);
    scale([1.1, 1.1, 1.1]) translate([0, -5, 0]) rotate([90]) cylinder(d=18.75, h=2.05, $fn=30);
    
    intersection(){
        translate([0, -6, 0]) rotate([0, 90, 0]) cylinder(d=10, h=30, $fn=3, center=true);
        translate([0, -6, 0]) rotate([90, 90, 0]) cylinder(d=40, h=12, $fn=3, center=true);
    }
}

difference(){
    hull(){
        translate([0, 0, 10]) rotate([90]) cylinder(d=35, h=5);
        translate([0, 0, -15]) rotate([90]) cylinder(d=35, h=5);
    }
   translate([0, -5, -20]) sphere(d=8.1);
   translate([0, 5, -20]) rotate([90, 0, 0]) cylinder(d=4.1, h=50);
   translate([0, -5, 10]) sphere(d=8.1);
   translate([0, 5, 10]) rotate([90, 0, 0]) cylinder(d=4.1, h=50);
}