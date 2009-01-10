//
//  Cell.m
//  GameOfLife
//
//  Created by Eric Smith on 1/10/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize alive;

-(void) kill {
	alive = false;
}

-(void) resurrect {
	alive = true;
}

@end
