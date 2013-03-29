//
//  AtomCloud.cpp
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#include "AtomCloud.h"

AtomCloud::AtomCloud(){
	}

AtomCloud::~AtomCloud(){
	}

void AtomCloud::addAtom(Atom a){
	//Add new atom to back of list
	atoms.push_back(a);
	}

void AtomCloud::pushToBuffer(DisplayBuffer *buffer){
	}

Atom makeAtom(float x, float y, float s){
	Atom ret;
	
	//Initialize with data
	ret.loc.x = x;
	ret.loc.y = y;
	ret.size = s;
	
	return ret;
	}