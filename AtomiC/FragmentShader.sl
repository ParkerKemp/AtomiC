#version 120

uniform sampler2D tex;

void main(){
	vec4 temp;
	temp = vec4(gl_PointCoord.st, 0, 1);
	gl_FragColor = texture2D(tex, gl_PointCoord);
	}