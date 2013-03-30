//
//  AtomCloud.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "AtomCloud.h"

AtomCloud::AtomCloud(int maxAtoms){
	_count = 0;
	_max = maxAtoms;
	atoms = new Atom[maxAtoms];
	_vertices = new float[maxAtoms * 2];
	}

AtomCloud::~AtomCloud(){
	delete[] atoms;
	delete[] _vertices;
	}

bool AtomCloud::addAtom(Atom a){
	//Return if AtomCloud is full
	if(_count >= _max)
		return false;

	//Add new atom to back of list
	atoms[_count] = a;
	_count++;
	
	return true;
	}

void AtomCloud::fillAtoms(Atom a){
	//addAtom() will return false when full
	while(addAtom(a));
	}

void AtomCloud::initBurst(int num, float x, float y, float speed, float speedVariance){
	//Return if num too high
	if(num > _max)
		return;
	
	//Start fresh
	_count = 0;
		
	for(int a = 0; a < num; a++){
		addAtom(makeAtom(x, y, 1));
		atoms[a].vec = randomVector() * variedValue(speed, speedVariance);
		}
	burst.loc.x = x;
	burst.loc.y = y;
	burst.speed = speed;
	}

void AtomCloud::update(){
	for(int a = 0; a < _count; a++){
		atoms[a].loc += atoms[a].vec;
		}
	}

void AtomCloud::updateVertexBuffer(){
	//int a = 0;
	for(int a = 0; a < _count; a++){
		_vertices[a * 2] = atoms[a].loc.x;
		_vertices[a * 2 + 1] = atoms[a].loc.y;
		}
	}

Atom makeAtom(float x, float y, float s){
	Atom ret;
	
	//Initialize with data
	ret.loc.x = x;
	ret.loc.y = y;
	
	//Movement vector zero by default
	ret.vec.x = 0;
	ret.vec.y = 0;
	
	ret.size = s;
	
	return ret;
	}

AtomVec randomVector(){
	AtomVec ret;
	float temp = 2 * M_PI * rand()/(float)RAND_MAX;
	ret.x = sin(temp);
	ret.y = cos(temp);
	return ret;
	}

float variedValue(float value, float variance){
	//Returns value with random variance (variance is taken as a percentage of the original value)
	return value * (1 + (rand()/(float)RAND_MAX * 2 - 1) * variance);
	}

//End of file
