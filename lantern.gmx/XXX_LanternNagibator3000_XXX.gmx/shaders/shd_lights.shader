//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~




varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float light_sm;
uniform vec2 pos;//x,y
uniform float light_range;

void main()
{
    float xx = v_vTexcoord.x;
    float yy = v_vTexcoord.y;

    vec2 point = vec2(xx - pos.x, yy - pos.y*9.0/16.0);
    
    float len = length(point);
    
    gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour; 
    
    if(len > light_range){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*2.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*3.5){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*5.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*8.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*11.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*15.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
    if(len > light_range*20.0){
        gl_FragColor.rgb = gl_FragColor.rgb - light_sm;
    }
  
}

