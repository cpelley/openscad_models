module holder(paint_diameter, frame_width){
    difference(){
        circle(d=paint_diameter+frame_width, center=true);
        circle(d=paint_diameter, center=true);
    }
}


module rack(paint_diameter=30, frame_width=10, num_x=6, num_y=4, staggered=true){
    staggered = staggered==true ? 1:0;
    translate_dist = paint_diameter + (frame_width/2);

    // a**2 + b**2 = c**2
    y_dist = (paint_diameter/2) + (frame_width/4);
    h_dist = translate_dist;
    x_adjust = sqrt(pow(h_dist,2) - pow(y_dist,2));
    for (i = [0:num_x-1]){
        translate([0, staggered*(i%2)*(translate_dist/2), 0])
        for (j = [0:num_y-1]){
            translate([i*(translate_dist-(translate_dist-x_adjust)), j*translate_dist, 0]) holder(paint_diameter, frame_width);
        }
    }
}


module paint_rack(paint_diameter=30, frame_width=10, num_x=8, num_y=4){
    difference(){
        linear_extrude(30){
            rack(staggered=true, num_x=num_x, paint_diameter=paint_diameter, frame_width=frame_width, num_y=num_y);
        }
        
        translate([0, (frame_width/2), 0]) cube([paint_diameter * (num_x-1), ((paint_diameter/2) + (frame_width/4)) * (num_y*2 - 1) - frame_width, 25]);
    }
}


paint_rack();