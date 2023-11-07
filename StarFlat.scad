
union ()
{
 //   cylinder (r = 20, h = 15, center = true);

    cylinder (r = 10, h = 10.1, center = true);


    for (i = [0:360])
        rotate ([0, 0, i])
            translate ([13 + sin (12.5 * i) + 2 * cos (4 * i), 0, 0])
                cube ([20, sin(i*25), 10], center = true);
}