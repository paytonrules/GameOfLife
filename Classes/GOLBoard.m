
#import "GOLBoard.h"
#import "Cell.h"

@implementation GOLBoard

-(id)init {
	super;
	sideLength = 15;
	for(int x=0; x < sideLength; x++) {
		for(int y=0; y < sideLength; y++) {
			board[x][y] = [[Cell alloc] init];
		}
	}
	return self;
}

-(id<CellProtocol>) getCellAt: (int) x by: (int) y {
	return board[x][y];
}

-(void)copyBoard: (id<BoardProtocol>)originalBoard {
	for(int x=0; x<sideLength; x++) {
		for(int y=0; y<sideLength; y++) {
			if([originalBoard isCellAliveAt: x by: y])
				[self bringToLifeAt: x by: y];
		}
	}
}

-(bool) isCellAliveAt: (int) x by: (int) y {
	if(x >= sideLength || y >= sideLength || x < 0 || y < 0) {
		return false;
	}
	return [board[x][y] alive];
}

-(void) bringToLifeAt: (int) x by: (int) y {
	[board[x][y] resurrect];
}

-(void) killCellAt: (int) x by: (int) y {
	[board[x][y] kill];
}

-(int)livingNeighborsAt: (int) x by: (int) y {
	int living_neighbors = 0;
	if([self isCellAliveAt: (x - 1) by: (y - 1)])
		living_neighbors++;
	if([self isCellAliveAt: x by: (y - 1)])
		living_neighbors++;
	if([self isCellAliveAt: (x + 1) by: (y - 1)])
		living_neighbors++;
	if([self isCellAliveAt: (x - 1) by: y])
		living_neighbors++;
	if([self isCellAliveAt: (x + 1) by: y])
		living_neighbors++;
	if([self isCellAliveAt: (x - 1) by: (y + 1)])
		living_neighbors++;
	if([self isCellAliveAt: x by: (y + 1)])
		living_neighbors++;
	if([self isCellAliveAt: (x + 1) by: (y + 1)])
		living_neighbors++;
	
	return living_neighbors;
}

@end
