$fn=50;
wide_layer_width = 55;
narrow_layer_width = 52;
layer_height = 2;
core_width = 49;
fin_length = 70;
layers = 20;
difference() {   // Hollows out the core
    for(layer = [0:layers]) {
        translate([-wide_layer_width/2, -wide_layer_width/2, layer*layer_height*2]) {
            cube([wide_layer_width, wide_layer_width, layer_height]);
        }
        translate([-narrow_layer_width/2, -narrow_layer_width/2, layer*layer_height*2+layer_height]) {
            difference() {
                cube([narrow_layer_width, narrow_layer_width, layer_height]);
                    for(circle = [0:16]) {
                    translate([layer_height + layer_height*circle*1.5, narrow_layer_width+1, layer_height/2]) {
                        rotate([90,0,0]) {
                            cylinder(narrow_layer_width+2, d=layer_height);
                        }
                    }
                    translate([-layer_height/2,layer_height + layer_height*circle*1.5, layer_height/2]) {
                        rotate([0,90,0]) {
                            cylinder(narrow_layer_width+2, d=layer_height);
                        }
                    }
                }
            }
        }
        for(side = [0,1]) {
            rotate([0,0,90*side]) {
                translate([-layer_height/2 + 6*layer_height, -fin_length/2, layer_height*layer*2]) {
                    cube([2, fin_length, layer_height*2]);
                }
                translate([-layer_height/2 - 6*layer_height, -fin_length/2, layer_height*layer*2]) {
                    cube([2, fin_length, layer_height*2]);
                }
            }
        }
    }
    translate([-core_width/2, -core_width/2, -1]) {
        cube([core_width, core_width, 100]);
    }
}