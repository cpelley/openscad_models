module guitar_pickup_knob(){
    module knob(){
        height=10;
        radius_1=2.8;
        radius_2=4;
        cylinder(r1=radius_1, r2=radius_2, h=height);
        translate([0, 0, height]) sphere(r=radius_2);
    }
    
    difference(){
        knob();
        translate([0, 0, -1]) cylinder(d=3.3, h=6);
    }
}


color("Khaki") guitar_pickup_knob($fn=100);