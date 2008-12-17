//
//  BoardTest.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "GTMSenTestCase.h"

@interface BoardTest : SenTestCase {
	Board *itsBoard;
}
-(void) testDeadCellsOnInit;
-(void)testOutOfRangeCell;
-(void)testOutOfRangeInY;
-(void)testBelowZeroInX;
-(void)testBelowZeroInY;
-(void)testSetCellStateAlive;

@end
