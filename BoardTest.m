//
//  BoardTest.m
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
#import "Board.h"
#import "BoardTest.h"

@implementation BoardTest

-(void) setUp {
	itsBoard = [[Board alloc] init];
}

-(void) tearDown {
	[itsBoard release];
	itsBoard = nil;
}

-(void)testDeadCellsOnInit {
	bool alive = [itsBoard isCellAliveAt: 0 by: 0];
	
	STAssertFalse(alive, @"", true);
}

-(void)testOutOfRangeCell {
	STAssertThrows([itsBoard isCellAliveAt:15 by: 0], @"Should throw an exception if cell is out of range");
}

-(void)testOutOfRangeInY {
	STAssertThrows([itsBoard isCellAliveAt: 0 by: 15], @"Should throw an exception if cell is out of range");
}

-(void)testBelowZeroInX {
	STAssertThrows([itsBoard isCellAliveAt: -1 by: 14], @"Should throw an exception if cell is out of range, below 0 too");
}

-(void)testBelowZeroInY {
	STAssertThrows([itsBoard isCellAliveAt: 14 by: -1], @"Should throw an exception if cell is out of range, below 0 too");
}

-(void)testSetCellStateAlive {
	[itsBoard bringToLifeAt: 1 by: 1];
	
	bool alive = [itsBoard isCellAliveAt: 1 by: 1];
	
	STAssertTrue(alive, @"");
}

-(void)testKillCell {
	[itsBoard bringToLifeAt: 1 by: 1];
	[itsBoard killCellAt: 1 by: 1];
	
	bool alive = [itsBoard isCellAliveAt: 1 by: 1];

	STAssertFalse(alive, @"");
}

-(void)testSetSecondCellAlive {
	[itsBoard bringToLifeAt: 10 by: 10];
	
	bool first_alive = [itsBoard isCellAliveAt: 1 by: 1];
	bool second_alive = [itsBoard isCellAliveAt: 10 by: 10];
	
	STAssertFalse(first_alive, @"");
	STAssertTrue(second_alive, @"");
}

-(void)testKillSecondCell {
	[itsBoard bringToLifeAt: 10 by: 10];
	[itsBoard killCellAt: 10 by: 10];
	
	bool alive = [itsBoard isCellAliveAt: 10 by: 10];
	
	STAssertFalse(alive, @"");
}

@end
