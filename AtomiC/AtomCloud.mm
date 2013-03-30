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
	_vertices = new float[maxAtoms * 2];
	}

AtomCloud::~AtomCloud(){
	atoms.clear();
	delete[] _vertices;
	}

void AtomCloud::addAtom(Atom a){
	//Return if AtomCloud is full
	if(_count >= _max)
		return;

	//Add new atom to back of list
	atoms.push_back(a);
	_count++;
	}

void AtomCloud::updateVertexBuffer(){
	int a = 0;
	for(std::list<Atom>::iterator i = atoms.begin(); i != atoms.end(); i++){
		_vertices[a] = i->x;
		_vertices[a + 1] = i->y;
		a += 2;
		}
	}

Atom makeAtom(float x, float y, float s){
	Atom ret;
	
	//Initialize with data
	ret.x = x;
	ret.y = y;
	ret.size = s;
	
	return ret;
	}