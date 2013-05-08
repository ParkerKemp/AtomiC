//
//  Controller.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "Controller.h"

//Temp
#include <stdio.h>

Controller::Controller(NSWindow *win){
	window = [win retain];
	}

Controller::~Controller(){
	[window release];
	if(cloud){
		for(int a = 0; a < 2; a++)
			delete cloud[a];
		delete[] cloud;
		}
	}

void Controller::init(){
	customizeWindow();
	glController = new GLController(window);
	loadLogic();
	}

void Controller::update(){
	logic();
	rendering();
	}

void Controller::logic(){
	//if(cloud->count() < 50){
	//	printf("%i\n", cloud->count());
	//	cloud->addAtom(makeAtom(rand()%windowWidth, rand()%windowHeight, 5));
	//	}
	for(int a = 0; a < 2; a++)
		cloud[a]->update();
	}

void Controller::rendering(){
	glController->clear(0.6, 0.6, 0.6, 1);
	for(int a = 0; a < 2; a++)
		glController->addAtomCloud(cloud[a]);
	glController->render();
	}

void Controller::loadLogic(){
	srand((unsigned)time(NULL));
	cloud = new AtomCloud*[2];
	for(int a = 0; a < 2; a++)
		cloud[a] = new AtomCloud(50);
	
	cloud[0]->initBurst(50, 300, 200, 4, 2);
	cloud[0]->setGravSource(500, 250);
	cloud[1]->initBurst(50, 700, 200, 4, 2);
	}

void Controller::initOpenGL(){
	/*NSOpenGLPixelFormatAttribute attributes[] = {NSOpenGLPFADoubleBuffer, 0};
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

	GLuint vertexShader, fragmentShader;
	//const char *code =
	char *code = shaderCode("PointSpriteShader.sl");
	if(!code)
		return;
	int *length = new int;
	*length = int(strlen(code));
	printf("%i\n", *length);
	
	vertexShader = glCreateShader(GL_VERTEX_SHADER);
	fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(vertexShader, 1, &code, length);
	
	glCompileShader(vertexShader);
	
	GLint compiled;
	glGetShaderiv(vertexShader, GL_COMPILE_STATUS, &compiled);
	if(compiled == GL_FALSE)
		printf("Failed to compile shader.\n");
	else
		printf("Successfully compiled shader!\n");
	
	char log[200];
	
	glGetShaderInfoLog(vertexShader, 200, 0, log);
	
	printf("%s\n", log);
	
	GLuint programObject = glCreateProgram();
	
	glAttachShader(programObject, vertexShader);
	glLinkProgram(programObject);
	
	GLint linked;
	glGetProgramiv(programObject, GL_LINK_STATUS, &linked);
	if(linked == GL_FALSE)
		printf("Failed to link program.\n");
	else
		printf("Successfully linked program!\n");
	
	glUseProgram(programObject);
	//glUseProgram(0);*/
	}

void Controller::customizeWindow(){
	//TODO: Determine what the "display" attribute actually does.
	[window setFrame: CGRectMake(200, 200, windowWidth, windowHeight) display: YES];
	}