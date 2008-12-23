//
//  Game.m
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

-(Board*)board {
	return myBoard;
}

-(void)setBoard:(Board*) board {
	myBoard = board;
}

-(void)advanceGeneration {
}

@end
