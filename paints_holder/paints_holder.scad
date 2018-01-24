module holder(paint_diameter, frame_width){
    difference(){
        circle(d=paint_diameter+frame_width, center=true);
        circle(d=paint_diameter, center=true);
    }
}


/// 80, 10, 12
/// 50, 10, 8
/// 30, 10, 5
module rack(paint_diameter=30, frame_width=10, num_x=6, num_y=4, staggered=true, x_adjust=5){
    staggered = staggered==true ? 1:0;
    translate_dist = paint_diameter + (frame_width/2);
    x_adjust = staggered * x_adjust;
    for (i = [0:num_x-1]){
        translate([0, staggered*(i%2)*(translate_dist/2), 0])
        for (j = [0:num_y-1]){
            translate([i*(translate_dist-x_adjust), j*translate_dist, 0]) holder(paint_diameter, frame_width);
        }
    }
}


module wall(paint_diameter=30, frame_width=10, num_x=6, staggered=true){
    num_y = 1;
    points = [ for (i = [-1:num_x+1]) [i*paint_diameter, abs(i%2)*20 ] ];
    linear_extrude(40){
        difference(){
            rack(staggered=true, x_adjust=x_adjust, num_x=num_x, paint_diameter=paint_diameter, frame_width=frame_width, num_y=1);
            polygon(concat([[-1*paint_diameter, 1000]], points, [[(num_x+1)*    paint_diameter, 1000]]));
        }
    }
}


paint_diameter = 30;
num_x = 5;
frame_width = 10;
num_y = 6;
x_adjust = 5;
linear_extrude(5){
    rack(staggered=true, x_adjust=x_adjust, num_x=num_x, paint_diameter=paint_diameter, frame_width=frame_width, num_y=num_y);
}

wall(paint_diameter=30, frame_width=10, num_x=6, staggered=true);
translate([0, (num_y-1)*(paint_diameter+frame_width), 0]) scale([1, -1, 1]) wall(paint_diameter=30, frame_width=10, num_x=6, staggered=true);