//
//  AtomCloud.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef __AtomiC__AtomCloud__
#define __AtomiC__AtomCloud__

class AtomVec{
	public:
		float x, y;
		
		AtomVec(){}
		
		AtomVec(float xx, float yy){x = xx; y = yy;}
		
		AtomVec operator * (float m){
			return AtomVec(x * m, y * m);
			}
	};

class AtomLoc{
	public:
		float x;
		float y;
		
		void operator += (AtomVec vec){
			x += vec.x;
			y += vec.y;
			}
	};

struct AtomBurstData{
	AtomLoc loc;
	float speed;
	};

struct Atom{
	AtomLoc loc;
	AtomVec vec;
	float size;
	};

class AtomCloud{
	private:
		Atom *atoms;
		float *_vertices;
		int _count, _max;
		
		AtomBurstData burst;
		
	public:
		AtomCloud(int maxAtoms);
		~AtomCloud();
		
		void initBurst(int num, float x, float y, float speed, float speedVariance);
		
		bool addAtom(Atom a);
		void fillAtoms(Atom a);
		
		void update();
		
		void updateVertexBuffer();
		
		float *vertexBuffer(){return _vertices;}
		int count(){return _count;}
	};

Atom makeAtom(float x, float y, float s);

AtomVec randomVector();

float variedValue(float value, float variance);



#endif

//End of file
