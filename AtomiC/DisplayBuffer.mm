//
//  DisplayBuffer.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "DisplayBuffer.h"

DisplayBuffer::DisplayBuffer(){
	//Initialize pointer with null value
	spriteVertices = 0;
	
	//Start with zero sprites
	spriteCount = 0;
	}

DisplayBuffer::~DisplayBuffer(){
	//Delete any existing Vertex data
	if(spriteVertices)
		delete[] spriteVertices;
	}

void DisplayBuffer::initSpriteVertices(int num){
	//Delete any existing Vertex data
	if(spriteVertices)
		delete[] spriteVertices;
	
	//Initialize new custom-sized Vertex array
	spriteVertices = new SpriteData[num];
	}

void DisplayBuffer::addSprite(LocationF loc, float size){
	//Copy vertex data from location
	spriteVertices[spriteCount].vertex.x = loc.x;
	spriteVertices[spriteCount].vertex.y = loc.y;
	spriteVertices[spriteCount].size = size;
	
	//Move to next sprite
	spriteCount++;
	}

void DisplayBuffer::drawSprites(){
	
	//Temp: set color to blue
	glColor4f(0, 0, 1, 1);
	
	glPointSize(10);
	
	glEnableClientState(GL_VERTEX_ARRAY);
	
	glVertexPointer(2, GL_FLOAT, sizeof(SpriteData), spriteVertices);
	
	glDrawArrays(GL_POINTS, 0, spriteCount);
	
	//glDisableClientState(GL_POINT_SIZE_ARRAY_APPLE);
	glDisableClientState(GL_VERTEX_ARRAY);
	}

void DisplayBuffer::drawCloud(AtomCloud *cloud){
	
	//Temp: set color to blue
	glColor4f(0, 0, 1, 1);
	
	glPointSize(10);
	
	glEnableClientState(GL_VERTEX_ARRAY);
	
	glVertexPointer(2, GL_FLOAT, 0, cloud->vertexBuffer());
	
	glDrawArrays(GL_POINTS, 0, cloud->count());
	
	glDisableClientState(GL_VERTEX_ARRAY);
	}

void DisplayBuffer::resetCounters(){
	spriteCount = 0;
	}