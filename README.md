# Trigonmetric-Coaster-Openscad-Code
Trigonmetric star inspired by Philippine flag star

SCAD lets one do 3D design procedurally... or at least with a C-like template language of its own.

So I thought it would be fun to try a trigonometry project and create a unique shape.
I like the star logo on the Philippine Flag so used that as inspiration

After awhile I got pretty close with this code, more or less.  Purrrrty.
Just grab this and plunk it into Openscad and hit the render button.  May take a minute to render.
Then export it as an STL file and print it.  There is also a flat cut version in the repo.

<pre>
$fn=100; 


module drawCoaster() {
    scale([2,2,1]) {
        union ()
        {
            fingers = 25;
            translate([0,0,-5.1])
            rounded_cylinder (r = 10, h = 10.5, n=1, $fn=60);


            for (i = [0:0.2:360])
                rotate ([0, 0, i])
                    translate ([13 + sin (fingers/2 * i) + 2 * cos (4 * i), 0, 0])
                        cube ([20, sin(i*fingers), sin(i*(fingers+.001))*10], center = true);

        }
    }
}


module rounded(){
  translate([0,0,0]) {
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

drawCoaster();
</pre>

The printed STL file looks like this:
![Trig Star image](https://github.com/tpfaff100/Trigonmetric-Coaster-Openscad-Code/blob/main/trigstar.jpg?raw=true)
(Printed on a Lulzbot TAZ6 3d printer with 'clear PLA resin.')
