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
	}

void Controller::update(){
	glClearColor(1, 1, 0, 1);
	glClear(GL_COLOR_BUFFER_BIT);
	[context flushBuffer];
	}

void Controller::initOpenGL(){
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

	glEnable(GL_SCISSOR_TEST);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	}

void Controller::customizeWindow(){
	//Determine what the "display" attribute actually does.
	[window setFrame: CGRectMake(0, 0, windowWidth, windowHeight) display: YES];
	}