//
//  AtomCloud.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__AtomCloud__
#define __AtomiC__AtomCloud__

#include <list>

#include "Structs.h"
#include "DisplayBuffer.h"

struct Atom{
	LocationF loc;
	float size;
	};

class AtomCloud{
	private:
		std::list<Atom> atoms;
	public:
		AtomCloud();
		~AtomCloud();
		
		void addAtom(Atom a);
		void pushToBuffer(DisplayBuffer* buffer);
	};

Atom makeAtom(float x, float y, float s);



#endif /* defined(__AtomiC__AtomCloud__) */

//End of file

