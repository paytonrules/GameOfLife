#import "GTMSenTestCase.h"
#import "GOLBoard.h"
#import "Game.h"

@interface GameTest : SenTestCase {
	GOLBoard* board;
	Game* game;
}
@end

@implementation GameTest

-(void)setUp {
	board = [[GOLBoard alloc] init];
	game = [[Game alloc] init];
}

-(void)tearDown {
	[board release];
	[game release];
	board = nil;
	game = nil;
}

-(void)testSetBoard {
	[game setBoard: board];
	
	GOLBoard* new_board = [game board];
	
	STAssertEquals(board, new_board, @"Expected two equal boards");
}

-(void)testAdvanceBoardOneGeneration {
	[game advanceGeneration];
}

-(void)testZeroLivingNeighborsWithLiveCell {
	[board bringToLifeAt: 1 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertFalse(alive, @"");		
}

-(void)testOneLivingNeighborWithLiveCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 1 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];

	STAssertFalse(alive, @"");		
}

-(void)testTwoLivingNeighborsWithLiveCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 0 by: 1];
	[board bringToLifeAt: 1 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertTrue(alive, @"");		
}

-(void)testThreeLivingNeighborsWithLiveCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 0 by: 1];
	[board bringToLifeAt: 1 by: 0];
	[board bringToLifeAt: 1 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertTrue(alive, @"");		
}

-(void)testFourLivingNeighborsWithLiveCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 0 by: 1];
	[board bringToLifeAt: 0 by: 2];
	[board bringToLifeAt: 1 by: 0];
	[board bringToLifeAt: 1 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertFalse(alive, @"");		
}

-(void)testZeroLivingNeighborsWithDeadCell {
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertFalse(alive, @"");	
}

-(void)testTwoLivingNeighborsWithDeadCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 0 by: 1];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertFalse(alive, @"");
}

-(void)testThreeLivingNeighborsWithDeadCell {
	[board bringToLifeAt: 0 by: 0];
	[board bringToLifeAt: 0 by: 1];
	[board bringToLifeAt: 1 by: 0];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 1 by: 1];
	
	STAssertTrue(alive, @"");		
}

-(void)testAdvanceGenerationWithDifferentCell {
	[board bringToLifeAt: 0 by: 0];
	[game setBoard: board];
	
	[game advanceGeneration];
	
	bool alive = [board isCellAliveAt: 0 by: 0];
	
	STAssertFalse(alive, @"");	
}

@end
