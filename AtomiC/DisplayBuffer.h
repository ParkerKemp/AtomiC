//
//  DisplayBuffer.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__DisplayBuffer__
#define __AtomiC__DisplayBuffer__

#include <Cocoa/Cocoa.h>

#include "Structs.h"

class DisplayBuffer{
	private:
		Vertex *spriteVertices;
	public:
		DisplayBuffer();
		~DisplayBuffer();
		
		void initSpriteVertices(int num);
		
		void addSprite(LocationF loc);

	};

#endif
