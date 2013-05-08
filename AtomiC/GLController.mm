//
//  GLController.cpp
//  AtomiC
//
//  Created by Parker Kemp on 5/8/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "GLController.h"

GLController::GLController(NSWindow *window){
	context = 0;
	initOpenGL(window);
	buffer = new DisplayBuffer;
		
	buffer->initSpriteVertices(100);
	}

GLController::~GLController(){
	if(buffer)
		delete buffer;
	if(context)
		[context release];
	
	}

void GLController::initOpenGL(NSWindow *window){
	NSOpenGLPixelFormatAttribute attributes[] = {NSOpenGLPFADoubleBuffer, 0};
	NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes: attributes];
	context = [[NSOpenGLContext alloc] initWithFormat:pixelFormat shareContext:nil];
	[context setView:[window contentView]];
	[context makeCurrentContext];

	//Disable Vsync (currently unused, i.e. Vsync is enabled)
	//int temp = 0;
	//[self.context setValues: &temp forParameter: NSOpenGLCPSwapInterval];	

	glViewport(0, 0, windowWidth, windowHeight);
	glMatrixMode(GL_PROJECTION);
	glOrtho(0, windowWidth, 0, windowHeight, -1, 100);
	
	//Flip all textures right side up
	glMatrixMode(GL_TEXTURE);
	glLoadIdentity();
	glScalef(1.0f, -1.0f, 1.0f);

	glMatrixMode(GL_MODELVIEW);
	
	pointSpriteShader = loadShader(GL_VERTEX_SHADER, "PointSpriteShader.sl");

	GLuint programObject = glCreateProgram();
	
	glAttachShader(programObject, pointSpriteShader);
	glLinkProgram(programObject);
	
	GLint linked;
	glGetProgramiv(programObject, GL_LINK_STATUS, &linked);
	if(linked == GL_FALSE)
		printf("Failed to link program.\n");
	else
		printf("Successfully linked program!\n");
	
	glUseProgram(programObject);
	//glUseProgram(0);
	}

void GLController::render(){
	[context flushBuffer];
	}

void GLController::clear(float r, float g, float b, float a){
	glClearColor(r, g, b, a);
	glClear(GL_COLOR_BUFFER_BIT);
	}

void GLController::addAtomCloud(AtomCloud *cloud){
	buffer->drawCloud(cloud);
	}

GLuint GLController::loadShader(GLenum type, const char *filename){
	GLuint shader;
	GLint compiled;
	char *code = shaderCode(filename);
	if(!code)
		return -1;

	shader = glCreateShader(type);
	glShaderSource(shader, 1, &code, 0);

	glCompileShader(shader);

	glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
	if(compiled)
		printf("Successfully compiled shader!\n");
	else{
		char log[200];
		printf("Failed to compile shader.\n");
		glGetShaderInfoLog(shader, 200, 0, log);
		printf("%s\n", log);
		}
	
	return shader;
	}

char *shaderCode(const char *filename){
	char *code;
	int fileLength;
	
	std::ifstream file([resourcePath(filename) UTF8String], std::ios::in);
	if(!file){
		printf("Failed to open shader file.\n");
		return 0;
		}

	file.seekg(0, file.end);
	fileLength = (int)file.tellg();
	code = new char[fileLength + 1];
	//printf("%i\n", fileLength);
	
	file.seekg(0, file.beg);
	
	file.read(code, fileLength);
	code[fileLength] = '\0';

	return code;
	}


//End of file

