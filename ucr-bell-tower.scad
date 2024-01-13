$fn=50;
wide_layer_width = 20;
narrow_layer_width = 17;
layer_height = 2;
for(layer = [0:20]) {
    translate([-wide_layer_width/2, -wide_layer_width/2, layer*layer_height*2]) {
        cube([wide_layer_width, wide_layer_width, layer_height]);
    }
    translate([-narrow_layer_width/2, -narrow_layer_width/2, layer*layer_height*2+layer_height]) {
        difference() {
            cube([narrow_layer_width, narrow_layer_width, layer_height]);
            for(circle = [0:4]) {
                translate([layer_height + layer_height*(circle)*1.5, 50, layer_height/2]) {
                    rotate([90,0,0]) {
                        cylinder(100, d=layer_height);
                    }
                }
            }
        }
    }
}