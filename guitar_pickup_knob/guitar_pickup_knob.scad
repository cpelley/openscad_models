module guitar_pickup_knob(){
    module knob(){
        height=18;
        radius_1=4;
        radius_2=6;
        cylinder(r1=radius_1, r2=radius_2, h=height);
        translate([0, 0, height]) sphere(r=radius_2);
    }
    
    difference(){
        knob();
        translate([0, 0, -1]) cylinder(d=2, h=10);
    }
}


color("Khaki") guitar_pickup_knob($fn=100);