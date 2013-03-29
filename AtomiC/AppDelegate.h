//
//  AppDelegate.h
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
	Controller *controller;
	}

@property (assign) IBOutlet NSWindow *window;

-(void)updateFrame;

@end
