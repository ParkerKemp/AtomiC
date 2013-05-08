//
//  DisplayBuffer.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "DisplayBuffer.h"

DisplayBuffer::DisplayBuffer(){
	//Temp
	tex = loadPNG("Particle.png");//png_texture_load("Particle.png", 0, 0);

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
	
	glPointSize(50);
	
	//glEnable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	//glEnable(GL_POINT_SPRITE);
	glBindTexture(GL_TEXTURE_2D, tex);

	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	
	//glVertexPointer(2, GL_FLOAT, 0, cloud->vertexBuffer());
	
	//glDrawArrays(GL_POINTS, 0, cloud->count());
	
	float verts[] = {50, 50, 50, 150, 150, 50, 50, 150, 150, 50, 150, 150};
	float texCoords[] = {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1};
	
	glVertexPointer(2, GL_FLOAT, 0, verts);
	glTexCoordPointer(2, GL_FLOAT, 0, texCoords);
	
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 6);
	
	glDisableClientState(GL_VERTEX_ARRAY);
	}

void DisplayBuffer::resetCounters(){
	spriteCount = 0;
	}

GLuint loadPNG(const char *filename){
	//Load texture from PNG file.
	//DO NOT LOSE THIS FUNCTION. IT IS FUCKING USEFUL.
	GLuint texture;
	NSImage *image;
	
	//Load image file into NSImage
	if((image = [[NSImage alloc] initWithContentsOfFile: resourcePath(filename)]) == nil){
		printf("Error reading file\n");
		return 0;
		}
	
	//Extract NSImage data to NSBitmapImageRep
	NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithData:[image TIFFRepresentation]];

	//Get texture ID from OpenGL, bind it
	glGenTextures(1, &texture);
	glBindTexture(GL_TEXTURE_2D, texture);
	
	//Get texture data from [bitmap bitmapData]
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image.size.width, image.size.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, [bitmap bitmapData]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	
	[image release];
	[bitmap release];
	return texture;
	}



//End of file

