difference(){
    scale([1, 1, 0.7]) surface(file = "earth.png", center = true);
    difference(){
        cube([400, 400, 60], center=true);
        cylinder(50, d=256, center=true);
    }
}