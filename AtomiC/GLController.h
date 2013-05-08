//
//  GLController.h
//  AtomiC
//
//  Created by Parker Kemp on 5/8/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__GLController__
#define __AtomiC__GLController__

#include <OpenGL/OpenGL.h>

#include "Structs.h"
#include "DisplayBuffer.h"
#include "AtomCloud.h"
#include <fstream>

class GLController{
	private:
		DisplayBuffer *buffer;
		NSOpenGLContext *context;
		GLuint pointSpriteShader;
	public:
		GLController(NSWindow *window);
		~GLController();
		
		void initOpenGL(NSWindow *window);
		
		void render();
		void clear(float r, float g, float b, float a);
		
		GLuint loadShader(GLenum type, const char *filename);
		
		void addAtomCloud(AtomCloud *cloud);
		
	};

char *shaderCode(const char *filename);

#endif /* defined(__AtomiC__GLController__) */
