//
//  AppDelegate.m
//  AtomiC
//
//  Created by Parker Kemp on 3/29/13.
//  Copyright (c) 2013 Parker Kemp. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc{
    [super dealloc];
	}

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification{
	controller = new Controller(self.window);
	controller->init();
	
	[NSTimer scheduledTimerWithTimeInterval: 0 target: self selector: @selector(updateFrame) userInfo: nil repeats: YES];
	}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)application{
	return YES;
	}

-(void)updateFrame{
	controller->update();
	}

@end
