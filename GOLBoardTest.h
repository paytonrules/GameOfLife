//
//  BoardTest.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "GTMSenTestCase.h"

@interface GOLBoardTest : SenTestCase {
	GOLBoard *itsBoard;
}
-(void)testDeadCellsOnInit;
-(void)testOutOfRangeInX;
-(void)testOutOfRangeInY;
-(void)testBelowZeroInX;
-(void)testBelowZeroInY;
-(void)testSetCellStateAlive;
-(void)testKillCell;
-(void)testSetSecondCellAlive;
-(void)testKillSecondCell;
-(void)testZeroLivingNeighbors;
-(void)testOneLivingNeighborTopLeft;
-(void)testOneLivingNeighborAbove;
-(void)testOneLivingNeighborTopRight;
-(void)testOneLivingNeighborRight;
-(void)testOneLivingNeighborBottomRight;
-(void)testOneLivingNeighborBelow;
-(void)testOneLivingNeighborBottomLeft;
-(void)testOneLivingNeighborLeft;
-(void)testEightLivingNeighbors;
-(void)testLivingNeighborsForCorner;
-(void)testCopyBoard;

@end
