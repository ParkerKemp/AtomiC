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
//#include <iostream>
#include <fstream>

#include "Structs.h"
#include "AtomCloud.h"

struct SpriteData{
	Vertex vertex;
	float size;
	};

class DisplayBuffer{
	private:
		SpriteData *spriteVertices;
		int spriteCount;
		GLuint tex;
	public:
		DisplayBuffer();
		~DisplayBuffer();
		
		void initSpriteVertices(int num);
		
		void addSprite(LocationF loc, float size);
		
		void drawSprites();
		
		void drawCloud(AtomCloud *cloud);
		
		void resetCounters();

	};

#endif

GLuint loadPNG(const char *filename);
