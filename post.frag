#version 100
precision mediump float;

varying vec3 v_Pos;
varying vec2 v_TexCoord;

uniform sampler2D u_InputSampler;

void main() {
    gl_FragColor = vec4(texture2D(u_InputSampler, v_TexCoord + vec2(sin(v_TexCoord.y * 10.), 0.)).rgb + vec3(0.1, 0.1, 0.1), 1.);
}
