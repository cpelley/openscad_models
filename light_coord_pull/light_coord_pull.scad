module half_pull(){
    module capsule(){
        cylinder(d=15, h=40);
        scale([1, 1, 0.3]) sphere(d=15);
        translate([0, 0, 40]) scale([1, 1, 0.3]) sphere(d=15);
    }

    difference(){
        difference(){
            capsule();
            translate([0, -25, -10]) cube([50, 50, 200]);
        }
        translate([0, 0, 7]) sphere(d=10, $fn=20);
        translate([0, 0, 7]) cylinder(d=3, h=50, $fn=20);
    }
}


$fn=50;
// One half
difference(){
    half_pull();
    for (i=[0:2]){
        translate([0, 4, 17+(i*9)]) cube([4, 2, 5], center=true);
        translate([0, -4, 17+(i*9)]) cube([4, 2, 5], center=true);
    }
}


// Second half
translate([0, 30, 0])
union(){
    sub=.2;
    half_pull();
    for (i=[0:2]){
        translate([0, 4, 17+(i*9)]) cube([4-sub, 2-sub, 5-sub], center=true);
        translate([0, -4, 17+(i*9)]) cube([4-sub, 2-sub, 5-sub], center=true);
    }
}