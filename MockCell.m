//
//  MockCell.m
//  GameOfLife
//
//  Created by Eric Smith on 1/10/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "MockCell.h"


@implementation MockCell

@synthesize resurrected;
@synthesize killed;

-(void) init {
	[super init];
	resurrected = false;
	killed = false;
}

-(void) resurrect {
	resurrected = true;
}

-(void) kill {
	killed = true;
}

-(bool) alive {
	return true;
}

@end
