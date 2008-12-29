//
//  GameTest.h
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "GTMSenTestCase.h"
#import "GOLBoard.h"
#import "Game.h"

@interface GameTest : SenTestCase {
	GOLBoard* board;
	Game* game;
}

-(void)testSetBoard;
-(void)testAdvanceBoardOneGeneration;
-(void)testZeroLivingNeighborsWithLiveCell;
-(void)testOneLivingNeighborWithLiveCell;
-(void)testTwoLivingNeighborsWithLiveCell;
-(void)testThreeLivingNeighborsWithLiveCell;
-(void)testFourLivingNeighborsWithLiveCell;
-(void)testZeroLivingNeighborsWithDeadCell;
-(void)testTwoLivingNeighborsWithDeadCell;
-(void)testThreeLivingNeighborsWithDeadCell;
-(void)testAdvanceGenerationWithDifferentCell;

@end
