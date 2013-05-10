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
	_sizes = new float[maxAtoms];
	gravEnabled = false;
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

void AtomCloud::resizeAtoms(float baseSize, float sizeVariance){
	for(int a = 0; a < _count; a++){
		atoms[a].size = variedValue(baseSize, sizeVariance);
		}
	}

void AtomCloud::setGravSource(float x, float y){
	gravSource.x = x;
	gravSource.y = y;
	gravEnabled = true;
	}

void AtomCloud::initBurst(int num, float x, float y, float speed, float speedVariance){
	//Return if num too high
	if(num > _max)
		return;
	
	//Start fresh
	_count = 0;
		
	for(int a = 0; a < num; a++){
		addAtom(makeAtom(x, y, 0));
		atoms[a].vec = randomVector() * variedValue(speed, speedVariance);
		}
	burst.loc.x = x;
	burst.loc.y = y;
	burst.speed = speed;
	}

void AtomCloud::update(){
	if(gravEnabled)
		updateVectors();
	updateLocations();
	}

void AtomCloud::updateVectors(){
	//TODO: add gravSource influence on vectors
	AtomVec temp;
	for(int a = 0; a < _count; a++){
		temp = gravSource - atoms[a].loc;
		//temp.x = 1 / temp.x;
		//temp.y = 1 / temp.y;
		temp.normalize();
		temp = temp * 0.2;
		atoms[a].vec += temp;
		}
	}

void AtomCloud::updateLocations(){
	for(int a = 0; a < _count; a++){
		atoms[a].loc += atoms[a].vec;
		}
	}

void AtomCloud::updateVertexBuffer(){
	//int a = 0;
	for(int a = 0; a < _count; a++){
		_vertices[a * 2] = atoms[a].loc.x;
		_vertices[a * 2 + 1] = atoms[a].loc.y;
		_sizes[a] = atoms[a].size;
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
	
	if(s)
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
