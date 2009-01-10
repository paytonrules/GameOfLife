//
//  Game.m
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

-(GOLBoard*)board {
	return myBoard;
}

-(void)setBoard:(GOLBoard*) board {
	myBoard = board;
}

-(void)advanceGeneration {
	GOLBoard* unchangedBoard = [[GOLBoard alloc] init];
	[unchangedBoard copyBoard: myBoard];
	for(int x=0; x < 15; x++) {
		for(int y=0; y < 15;y++) {
			int living_neighbors = [unchangedBoard livingNeighborsAt: x by: y];
			if(living_neighbors < 2 || living_neighbors > 3)
				[myBoard killCellAt: x by: y];
			else if(living_neighbors == 3)
				[myBoard bringToLifeAt: x by: y];
		}
	}
}

@end
