#define draw_SHADER_sceneFringe
var enabled = argument0;

//SHADER SETUP
if enabled = true
{
    // Display setup ---------------------------------------------------------------------------
    display_set_gui_size(room_width, room_height);

    if os_type == os_android
    {     
        vRatio = display_get_gui_width() / display_get_gui_height(); //distort the sampler uvs according to the screen ratio in the mobile devices...
    }else{
        vRatio = 1.0;
    }
    
    // Samplers / Textures ---------------------------------------------------------------------
    
    // Shader setup ----------------------------------------------------------------------------
    var shader    = shader_sceneFringe;
    var u_vRatio = shader_get_uniform(shader, "u_vRatio");
    var u_threshold = shader_get_uniform(shader, "u_threshold");

    shader_set(shader);
        shader_set_uniform_f(u_vRatio, vRatio);
        //shader_set_uniform_f(u_threshold, tune(1,'thresh',0.01,.01));
        shader_set_uniform_f(u_threshold, 0.005);
        draw_surface(application_surface,0,0);
    shader_reset();
}

#define draw_SHADER_magnify
var enabled = argument0;
var magTime = argument1;

//ANIMATION
/*
    ideally this should be moved out the draw event
    for better control...
*/
var timeMult = 0.05; //make the animation slower or faster...
var time = magTime * timeMult;
var oscillatorValue = sin(time);
var oscillatorValueAbs = abs(sin(time));

//SHADER SETUP
if enabled = true
{
    // Display setup ---------------------------------------------------------------------------
    display_set_gui_size(room_width, room_height);

    if os_type == os_android
    {     
        vRatio = display_get_gui_width() / display_get_gui_height(); //distort the sampler uvs according to the screen ratio in the mobile devices...
    }else{
        vRatio = 1.0;
    }

    // Samplers / Textures ---------------------------------------------------------------------
    var magnify_map0 = smp_spherize;

    // Shader setup ----------------------------------------------------------------------------
    var shader    = shader_magnify;
    var u_vRatio = shader_get_uniform(shader, "u_vRatio");
    var sampler0  = shader_get_sampler_index(shader, "sampler0")
    var texture0  = background_get_texture(magnify_map0);
    var u_threshold = shader_get_uniform(shader, "u_threshold");
    
    var posx = shader_get_uniform(shader,"posx");
    var posy = shader_get_uniform(shader,"posy");

    shader_set(shader);
        shader_set_uniform_f(u_vRatio, vRatio);
        shader_set_uniform_f(u_threshold, 0.1 * oscillatorValue);
        
        //shader_set_uniform_f(posx,0);
        //shader_set_uniform_f(posy,0);

        texture_set_stage(sampler0,texture0);
        draw_surface(application_surface,0,0);
    shader_reset();
}

#define draw_SHADER_shockwave
//if !surface_exists(shock_surf) shock_surf = surf_make_shockwave();
var shockwave_x = argument0;
var shockwave_y = argument1;

shader_set(shd_shockwave);
var_time_var+=0.008;

shader_set_uniform_f(uni_time, var_time_var);
shader_set_uniform_f(uni_mouse_pos, shockwave_x, shockwave_y);
shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
shader_set_uniform_f(uni_shock_amplitude, var_shock_amplitude);
shader_set_uniform_f(uni_shock_refraction, var_shock_refraction );
shader_set_uniform_f(uni_shock_width, var_shock_width);

surface_copy(shock_surf,0,0,application_surface);
//draw_surface_stretched(shock_surf,0,0,window_get_width(), window_get_height());
draw_surface_stretched(shock_surf,0,0,screen_w, screen_h);

shader_reset();