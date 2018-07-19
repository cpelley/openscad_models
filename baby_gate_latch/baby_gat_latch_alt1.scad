$fn=100;

// Gate hold.
translate([0, -2., 0])
difference(){
    // Half circle
    rotate([90]) cylinder(d=27, h=12);
    translate([0, 0, 25]) cube([50, 50, 50], center=true);
    // Disk cut-out.
    scale([1.1, 1.1, 1.1]) translate([0, -5, 0]) rotate([90]) cylinder(d=18.75, h=2.05, $fn=30);
    
    // Slope cutout (make it easier for the gat to fall into the notch).
    intersection(){
        translate([0, -6, 0]) rotate([0, 90, 0]) cylinder(d=10, h=30, $fn=3, center=true);
        translate([0, -6, 0]) rotate([90, 90, 0]) cylinder(d=40, h=12, $fn=3, center=true);
    }
}


difference(){
    // Backplate
    hull(){
        translate([0, 0, 60]) rotate([90]) cylinder(d=35, h=5);
        translate([0, 0, -15]) rotate([90]) cylinder(d=35, h=5);
    }
    
    // Lower screw cutout.
   translate([0, -5, -20]) sphere(d=8.1);
   translate([0, 5, -20]) rotate([90, 0, 0]) cylinder(d=4.1, h=50);

    // Upper screw cutout.    
   translate([0, -5, 60]) sphere(d=8.1);
   translate([0, 5, 60]) rotate([90, 0, 0]) cylinder(d=4.1, h=50);
   
   // Latch cutout 
   translate([0, 0, 33]) cube([10, 20, 35], center=true);
}


rotate([-2, 0, 0]) translate([0, -5.8, 33.5]) cube([9, 2, 35], center=true);
difference(){
    // Lower & upper triangle.
    union(){
        translate([0, -5, 18.5]) rotate([60, 0, 0]) rotate([0, 90, 0]) cylinder(r=5, h=9, $fn=3, center=true);
        translate([0, -5, 45]) rotate([30, 0, 0]) rotate([0, 90, 0]) cylinder(r=8, h=9, $fn=3, center=true);
    }
    // Making triangles not extend behind the arm.
    translate([0, 0, 15]) rotate([-2, 0, 0]) cube([9.12, 9, 100], center=true);
}