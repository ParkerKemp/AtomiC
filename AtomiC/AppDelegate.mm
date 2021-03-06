//
//  AppDelegate.m
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#import "AppDelegate.h"

//Temp
//#import <list>

@implementation AppDelegate

-(void)dealloc{
    [super dealloc];
	}

-(void)applicationDidFinishLaunching:(NSNotification*)aNotification{
	controller = new Controller(self.window);
	controller->init();
	while(![self.window isVisible]){
		printf("Not visible yet.\n");
		}
	[NSTimer scheduledTimerWithTimeInterval: 0 target: self selector: @selector(updateFrame) userInfo: nil repeats: YES];
	}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)application{
	return YES;
	}

-(void)updateFrame{
	controller->update();
	}

@end
