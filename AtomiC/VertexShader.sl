#version 120

void main(void){
	gl_PointSize = gl_MultiTexCoord0.x;
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor = gl_Color;
	}