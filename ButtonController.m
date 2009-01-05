//
//  ButtonController.m
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "ButtonController.h"


@implementation ButtonController
@synthesize X;
@synthesize Y;

- (id) initWithX: (int) x Y: (int) y
{
	self.X = x;
	self.Y = y;
	return self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
