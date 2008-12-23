//
//  GameTest.m
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "GameTest.h"
#import "Board.h"
#import "Game.h"

@implementation GameTest

-(void)testSetBoard {
	Board* board = [[Board alloc] init];
	Game* game = [[Game alloc] init];
	
	[game setBoard: board];
	
	Board* new_board = [game board];
	
	STAssertEquals(board, new_board, @"Expected two equal boards");
}

-(void)testAdvanceBoardOneGeneration {
	Board* board = [[Board alloc] init];
	Game* game = [[Game alloc] init];

	[game advanceGeneration];
}

@end
