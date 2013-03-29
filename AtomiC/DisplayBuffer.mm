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
	spriteVertices = new Vertex[num];
	}