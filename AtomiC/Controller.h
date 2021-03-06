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
#include "AtomCloud.h"
#include "DisplayBuffer.h"

#include "GLController.h"

class Controller{
	private:
		GLController *glController;
		AtomCloud **cloud;
		bool a = false;
		NSWindow *window;
		
	public:
		Controller(NSWindow *win);
		~Controller();
		
		void init();
		
		void loadLogic();
		
		void customizeWindow();
		
		void update();
		
		void logic();
		void rendering();
	};
#endif /* defined(__AtomiC__Controller__) */
