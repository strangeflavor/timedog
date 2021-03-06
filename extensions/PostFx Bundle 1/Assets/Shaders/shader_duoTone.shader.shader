attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

uniform float u_vRatio;

varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
        
    v_uv0       = in_TextureCoord;    
    v_uv0Ratio  = in_TextureCoord * vec2(1.0, u_vRatio);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_uv0;
varying vec2 v_uv0Ratio;

uniform vec3 u_colorA;
uniform vec3 u_colorB;

void main()
{
    vec4 DF = texture2D( gm_BaseTexture, v_uv0 );
    vec3 weights = vec3( 0.3, 0.59, 0.11);
    float lum = dot(DF.rgb, weights);
    
    vec4 Complete = vec4(1.0,1.0,1.0,1.0);
    Complete.rgb = mix(u_colorA, u_colorB, lum);
    
    gl_FragColor = Complete;
}

