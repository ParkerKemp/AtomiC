//
//  Controller.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__Controller__
#define __AtomiC__Controller__

#include <OpenGL/OpenGL.h>
#include "Structs.h"

class Controller{
	private:
		NSOpenGLContext *context;
		NSWindow *window;
	public:
		Controller(NSWindow *win);
		~Controller();
		
		void initOpenGL();
		void customizeWindow();
		
		void update();
	};
#endif /* defined(__AtomiC__Controller__) */
