attribute vec3 in_Position;                  // (x,y,z)r.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    pos = object_space_pos.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 pos;

uniform vec4 texuvs;
uniform float time;

void main()
{
    float _x = v_vTexcoord.x + sin(time + pos.y * 0.05 + pos.x * 0.1) * texuvs.z * 0.01 * (1.0-(v_vTexcoord.y - texuvs.y) * texuvs.w);
    _x = clamp(_x ,texuvs.x, texuvs.x + texuvs.z);  //keep _x inside of sprite
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(_x,v_vTexcoord.y) );
}

