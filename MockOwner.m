//
//  MockOwner.m
//  GameOfLife
//
//  Created by Eric Smith on 1/5/09.activity
//  Copyright 2009 8th Light. All rights reserved.
//

#import "MockOwner.h"


@implementation MockOwner

-(void) init {
	[super init];
	
	itsX = 0;
	itsY = 0;
	bringToLifeAtCalled = false;
}

-(void) bringToLifeAt: (int) x Y: (int) y {
	itsX = x;
	itsY = y;
	bringToLifeAtCalled = true;
}

-(bool) bringToLifeAtCalledWithX: (int) x Y: (int) y {
	return bringToLifeAtCalled && (x == itsX) && (y == itsY);
}

-(void) killAt: (int) x Y: (int) y {
	itsX = x;
	itsY = y;
	killCalled = true;
}

-(bool) killAtCalledWithX: (int) x Y: (int) y {
	return killCalled && (x == itsX) && (y == itsY);
}



@end
