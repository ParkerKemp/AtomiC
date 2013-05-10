//
//  Pipeline.h
//  AtomiC
//
//  Created by Parker Kemp on 5/9/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__Pipeline__
#define __AtomiC__Pipeline__

#include <OpenGL/OpenGL.h>

#include <fstream>

class Pipeline{
	private:
		GLuint program, vertShader, fragShader;
	public:
		Pipeline();
		~Pipeline();
		GLuint loadGenericShader(const char *filename, GLenum type);
		void loadVertexShader(const char *filename);
		void loadFragmentShader(const char *filename);
		void linkProgram();
		void activate();
		void deactivate();
	};

char *shaderCode(const char *filename);

#endif /* defined(__AtomiC__Pipeline__) */
