$fn=100;
module number(){
    intersection(){
        translate([-4, -4, 8]) linear_extrude(h=40) text("2", center=true);

        difference(){
            sphere(d=20);
            translate([0, 0, -10]) cube([30, 30, 20], center=true);
        }
    }
}


scale([10, 10, 10]) number();