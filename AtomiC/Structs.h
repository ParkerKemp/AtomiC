//
//  Structs.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#ifndef AtomiC_Structs_h
#define AtomiC_Structs_h

#import <Cocoa/Cocoa.h>

#define windowWidth 1000
#define windowHeight 500

struct LocationF{
	float x;
	float y;
	};

struct Vertex{
	float x;
	float y;
	};

NSString *resourcePath(const char *filename);

#endif
