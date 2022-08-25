
    wallthickness=4;
difference(){
lamp(37,9,wallthickness,120,0.5);
//hole on the bottom
cylinder(r=7/2 * 10,h=4*10);
}

module lamp(radius,wallheight,wall_thickness,height,window_height)
{
difference(){
difference(){
difference(){
translate([0,0,-1.71*(radius)])
difference()
 translate([0,0,wallheight])
{for ( j = [1 : 1 : 3] ){    
    for ( i = [0 : 60 : 360] ){
        angle=i;
        z = ((angle%120)==0 ) ? 1.71*(radius)*j : 1.71*(radius)*j+(1.71*(radius)*0.5 );
    
        translate([sqrt(2)*radius*sin(angle),sqrt(2)*radius*cos(angle),z])
        rotate([90,0,-i])hexagon_shell(1.02*radius,wallheight,wall_thickness,window_height);
        }
        }
    
 }

 cyl_h=radius*2;
 t=height;
 translate([0,0,cyl_h/2+wallheight/2+t]) 
 cylinder(h = cyl_h+wallheight, r1 = 2*radius, r2 = 2*radius, center = true);
}
translate([0,0,-height/2])
cylinder(h=120,r=radius*2,center=true);
}

negative_shell((radius+wall_thickness)*sqrt(2)*1.1,height,wall_thickness*20);
}

//top finish
translate([0,0,height])
hexagon_shell((radius+2*wall_thickness)*sqrt(2),wallheight,wall_thickness,window_height);
//bottom finish
hexagon_shell((radius+2*wall_thickness)*sqrt(2),wallheight,wall_thickness,window_height);
}

    
  module hexagon_shell(radius,height,thickness,window_height)
    {   difference(){
        cylinder(r=radius,h=height,$fn=6);       
        cylinder(r=radius-thickness,h=height,$fn=6);
        }
        translate([0,0,height/2])
        cylinder(r=radius,h=window_height,$fn=6);
 
    }
    
      module negative_shell(radius,height,thickness)
    {    difference(){
        cylinder(r=radius+thickness,h=height,$fn=6);       
        cylinder(r=radius,h=height,$fn=6);
        }
 
    }