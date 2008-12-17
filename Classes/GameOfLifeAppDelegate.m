//
//  GameOfLifeAppDelegate.m
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "GameOfLifeAppDelegate.h"
#import "GameOfLifeViewController.h"

@implementation GameOfLifeAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
