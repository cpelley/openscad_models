module castle_disk(thickness=3.73, diameter=35.6){
    module knife(){
        rotate([0, 0, -90])
        polygon([[8,20/*1:-1,4,1,-8*/] ,[8.08,18.76] ,[8.04,17.71] ,[7.92,16.62] ,[7.72,15.49] ,[7.46,14.33] ,[7.13,13.16] ,[6.74,11.97] ,[6.3,10.77] ,[5.81,9.57] ,[5.29,8.37] ,[4.73,7.2] ,[4.15,6.04] ,[3.55,4.9] ,[2.93,3.81] ,[2.3,2.75] ,[1.67,1.74] ,[1.04,0.78] ,[0.43,-0.11] ,[-0.17,-0.93] ,[-0.89,-1.86] ,[-1.56,-2.65] ,[-2.29,-3.41],[-3,-4/*1:3,2,-5,-1*/] ,[-4.07,-4.02] ,[-5,-3.56] ,[-5.67,-2.68] ,[-6.06,-1.75] ,[-6.34,-0.66] ,[-6.53,0.39] ,[-6.67,1.5] ,[-6.78,2.66] ,[-6.88,3.84] ,[-6.98,5.02] ,[-7.1,6.17] ,[-7.24,7.27] ,[-7.43,8.29] ,[-7.73,9.35],[-8,10/*1:2,-4,-1,2*/] ,[-8.55,10.84] ,[-9.25,11.69] ,[-9.98,12.55] ,[-10.68,13.35] ,[-11.37,14.19] ,[-12.02,15.02] ,[-12.59,15.85] ,[-13.08,16.75] ,[-13.39,17.75] ,[-13.2,18.75],[-13,19/*1:-2,-2,2,1*/] ,[-11.95,19.38] ,[-10.95,19.67] ,[-9.93,19.93] ,[-8.78,20.2] ,[-7.77,20.41] ,[-6.71,20.63] ,[-5.6,20.84] ,[-4.46,21.03] ,[-3.3,21.21] ,[-2.12,21.38] ,[-0.96,21.51] ,[0.19,21.62] ,[1.31,21.7] ,[2.38,21.74] ,[3.4,21.74] ,[4.58,21.67] ,[5.62,21.53] ,[6.67,21.24] ,[7.55,20.73]]);
    }


    module lightning_bolt(){
        rotate([0, 0, 45]) polygon([[19,17],[-3,5],[6,5],[-15,-7],[-5,-7],[-20,-20],[7,-6],[-2,-6],[17,8],[9,8]]);
    }

    module ring_cut(x_translate, y_translate){
        module single_ring(x_translate, y_translate){
            rotate_extrude(convexity = 10, $fn = 20)
            translate([x_translate, (thickness/2)+y_translate, 0])
            circle(d=thickness/1.5, $fn=50);
        }
        single_ring(x_translate, y_translate/2);
        single_ring(x_translate, -y_translate/2);
    }

    module disk() {
        difference(){
            circle(d=diameter-thickness, $fn=50);
            // Six sided via fn
            circle(d=(diameter/5.4), $fn=6);
            
            // Knives and lightning_bolt
            num_knives = 6;
            knive_angle = 360/num_knives;
            for (i = [1:num_knives]) {
                // Knife
                rotate([0, 0, knive_angle*i]) translate([8, 0, 0]) scale([.35, .35, 1]) knife();
                // lightning sbolt
                rotate([0, 0, knive_angle*i]) translate([-1, 10, 10]) scale([.35, .22, .25]) lightning_bolt();
            }
        }
    }


    module rounded_edge(){
        translate([0,0,0]){
            rotate_extrude(convexity = 10, $fn = 100)
            translate([(diameter/2) - (thickness/2), thickness/2, 0])
            // Extrude a half circule rather than a full one to minimise plastic usage.
            difference(){
                circle(d=thickness, $fn=50);
                translate([-thickness/2, -thickness/2, 0]) square([thickness/2, thickness*2]);
            }
        }
    }

    color("Grey")
    linear_extrude(thickness)
    disk();
    
    color("DarkGrey")
    rounded_edge();
}

// We scale to make slightly smaller (for some reason it's coming out too big).
scale([.98, .98, .98]) castle_disk();