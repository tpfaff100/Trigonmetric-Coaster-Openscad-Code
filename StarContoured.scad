$fn=100;


module drawCoaster() {

    scale([2,2,1]) {

        union ()
        {
            
              fingers = 25;
         //   cylinder (r = 20, h = 15, center = true);

        //    cylinder (r = 10, h = 10.1, center = true);
            translate([0,0,-5.1])
            rounded_cylinder (r = 10, h = 10.5, n=1, $fn=60);


            for (i = [0:0.2:360])
                rotate ([0, 0, i])
                    translate ([13 + sin (fingers/2 * i) + 2 * cos (4 * i), 0, 0])
        //                cube ([20, sin(i*fingers), sin(i*(fingers+.001))*10*sin(i*5)], center = true);
                        cube ([20, sin(i*fingers), sin(i*(fingers+.001))*10], center = true);

        }
    }
}


module rounded(){
translate([0,0,0]){
rotate_extrude(convexity = 10, $fn = 100)
translate([11, 4, 0])
circle(r = 3, $fn = 100);
}
}


// r[adius], h[eight], [rou]n[d]
module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

//rounded_cylinder(r=10,h=10,n=2,$fn=60);



drawCoaster();

