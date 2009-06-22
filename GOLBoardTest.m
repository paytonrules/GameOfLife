#import "GOLBoard.h"
#import "GTMSenTestCase.h"

@interface GOLBoardTest : SenTestCase {
	GOLBoard *itsBoard;
}
@end

@implementation GOLBoardTest

-(void) setUp {
	itsBoard = [[GOLBoard alloc] init];
}

-(void) tearDown {
	[itsBoard release];
	itsBoard = nil;
}

-(void)testDeadCellsOnInit {
	bool alive = [itsBoard isCellAliveAt: 0 by: 0];
	
	STAssertFalse(alive, nil);
}

-(void)testOutOfRangeInX {
	bool alive = [itsBoard isCellAliveAt: COLUMNS + 1 by: 0];
	
	STAssertFalse(alive, @"");	
}

-(void)testOutOfRangeInY {
	bool alive = [itsBoard isCellAliveAt: 0 by: ROWS + 1];
	
	STAssertFalse(alive, @"");
}

-(void)testBelowZeroInX {
	bool alive = [itsBoard isCellAliveAt: -1 by: 0];
	
	STAssertFalse(alive, @"");		
}

-(void)testBelowZeroInY {
	bool alive = [itsBoard isCellAliveAt: 0 by: -1];
	
	STAssertFalse(alive, @"");		
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

-(void)testZeroLivingNeighbors {
	int neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(0, neighbors, nil);
}

-(void)testOneLivingNeighborTopLeft {
	[itsBoard bringToLifeAt: 0 by: 0];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborAbove {
	[itsBoard bringToLifeAt: 1 by: 0];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborTopRight {
	[itsBoard bringToLifeAt: 2 by: 0];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborRight {
	[itsBoard bringToLifeAt: 2 by: 1];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborBottomRight {
	[itsBoard bringToLifeAt: 2 by: 2];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborBelow {
	[itsBoard bringToLifeAt: 1 by: 2];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborBottomLeft {
	[itsBoard bringToLifeAt: 0 by: 2];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testOneLivingNeighborLeft {
	[itsBoard bringToLifeAt: 0 by: 1];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(1, living_neighbors, @"Expected 1 living neighbors, but got %d", living_neighbors);
}

-(void)testEightLivingNeighbors {
	[itsBoard bringToLifeAt: 0 by: 0];
	[itsBoard bringToLifeAt: 1 by: 0];
	[itsBoard bringToLifeAt: 2 by: 0];
	[itsBoard bringToLifeAt: 2 by: 1];
	[itsBoard bringToLifeAt: 2 by: 2];
	[itsBoard bringToLifeAt: 1 by: 2];
	[itsBoard bringToLifeAt: 0 by: 2];
	[itsBoard bringToLifeAt: 0 by: 1];
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(8, living_neighbors, @"Expected 8 living neighbors, but got %d", living_neighbors);
}

-(void)testLivingNeighborsForCorner {
	int living_neighbors = [itsBoard livingNeighborsAt: 0 by: 0];
	
	STAssertEquals(0, living_neighbors, @"Expected 0 living neighbors, but got %d", living_neighbors);
}

-(void)testSpotShouldNotCountItself {
	[itsBoard bringToLifeAt: 1 by: 1];
	
	int living_neighbors = [itsBoard livingNeighborsAt: 1 by: 1];
	
	STAssertEquals(0, living_neighbors, @"Expected 0 living neighbors, but got %d", living_neighbors);
}

-(void)testCopyBoard {
	[itsBoard bringToLifeAt: 1 by: 0];
	[itsBoard bringToLifeAt: 2 by: 1];

	GOLBoard* new_board = [[GOLBoard alloc] init];
	[new_board copyBoard: itsBoard];
	
	bool firstAlive = [new_board isCellAliveAt: 1 by: 0];
	bool secondAlive = [new_board isCellAliveAt: 1 by: 0];
	
	STAssertTrue(firstAlive, @"");
	STAssertTrue(secondAlive, @"");
}

-(void)testGetCellAt 
{
	[itsBoard bringToLifeAt:1 by:2];
	
	Cell *cell = [itsBoard getCellAt: 1 by:2];
	
	STAssertTrue(cell.alive, nil);
}

-(void)testGetDimensions
{
	STAssertEquals(ROWS, [itsBoard rows], nil);
	STAssertEquals(COLUMNS, [itsBoard columns], nil);
}

@end
