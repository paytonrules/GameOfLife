//
//  Board.m
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Board.h"

@implementation Board

-(id)init {
	super;
	sideLength = 15;
	return self;
}

-(bool) isCellAliveAt: (int) x by: (int) y {
	if(x >= sideLength || y >= sideLength || x < 0 || y < 0) {
		[NSException raise: @"Out of Range" format: @"out of range"];
	}
	return board[x][y];
}

-(void) bringToLifeAt: (int) x by: (int) y {
	board[x][y] = true;
}

-(void) killCellAt: (int) x by: (int) y {
	board[x][y] = false;
}

@end
