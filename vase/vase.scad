num_pipes = 8;
for (i=[0:num_pipes]){
    linear_extrude(height=500, slices=120, twist=120, scale=2) rotate([0, 0, i*(360/num_pipes)]) translate([0, 60, 0]) circle(d=50, $fn=60);
}