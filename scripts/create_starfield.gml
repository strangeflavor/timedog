//create the model
temp = d3d_model_create();

    //create the star streaks with lines
        /*
    d3d_model_primitive_begin(temp,pr_linelist);
    for (i=0; i<500; i+=1){
        var tx = random_range(-100,100), ty = random_range(-100,100), tz = random_range(-100,100), tc = make_color_hsv(random_range(128,177),random(255),255);
        d3d_model_vertex_colour(temp,tx,ty+1,tz,tc,0);
        d3d_model_vertex_colour(temp,tx,ty-1,tz,tc,1);
        }
    d3d_model_primitive_end(temp);
    */

    //add the stars with points
    d3d_model_primitive_begin(temp,pr_pointlist);
    for (i=0; i<1000; i+=1){
        var tx = random_range(-100,100), ty = random_range(-100,100), tz = random_range(-100,100), tc = make_color_hsv(random_range(128,255),random(255),255);
        //d3d_model_vertex_colour(temp,tx,ty,tz,tc,1);
        d3d_model_ellipsoid(temp,tx,ty,tz,tx+2,ty+2,tz+2,1,1,24);
        }
    d3d_model_primitive_end(temp);

//return the model from the script
return temp;
