$fn = 100;

outer_diameter = 56;
inner_diameter = 50;

spacer_height = 20;
inner_height = 4;

screw_inner_diameter = 5;
screw_offset = 22;
screw_outer_diameter = 10;

inner_hole_diameter = 36;

difference () {
  translate ([0,0,-spacer_height]) {
    difference() {
      // Main block
      cylinder(spacer_height + inner_height,outer_diameter/2,outer_diameter/2);
      // Remove as much as possible on the inside
      translate([0,0,-1]) cylinder(spacer_height + inner_height + 2, inner_hole_diameter/2,inner_hole_diameter/2);
      // Holes for screws
      translate([-screw_offset,0,-1]) cylinder(spacer_height + inner_height + 2, screw_inner_diameter/2,screw_inner_diameter/2);
      translate([+screw_offset,0,-1]) cylinder(spacer_height + inner_height + 2, screw_inner_diameter/2,screw_inner_diameter/2);
    }
  }
  // Inner ring
  difference() {
    cylinder(inner_height + 1, outer_diameter/2+1, outer_diameter/2+1);
    cylinder(inner_height + 1, inner_diameter/2, inner_diameter/2);
  }
  // Space for screw holes
  translate([-screw_offset,0,0]) cylinder(inner_height + 1, screw_outer_diameter/2, screw_outer_diameter/2);
  translate([+screw_offset,0,0]) cylinder(inner_height + 1, screw_outer_diameter/2, screw_outer_diameter/2);
  translate([-screw_offset,0,inner_height-1]) cylinder(2, screw_outer_diameter/2, screw_outer_diameter/2+2);
  translate([+screw_offset,0,inner_height-1]) cylinder(2, screw_outer_diameter/2, screw_outer_diameter/2+2);
}
