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

struct Atom{
	float x;
	float y;
	float size;
	};

class AtomCloud{
	private:
		std::list<Atom> atoms;
		float *_vertices;
		int _count, _max;
		
	public:
		AtomCloud(int maxAtoms);
		~AtomCloud();
		
		void addAtom(Atom a);
		void updateVertexBuffer();
		
		float *vertexBuffer(){return _vertices;}
		int count(){return _count;}
	};

Atom makeAtom(float x, float y, float s);



#endif

//End of file

