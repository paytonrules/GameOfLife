#import "GOLBoard.h"
#import "Cell.h"

@implementation GOLBoard

-(id)init 
{
	super;
	
	for(int x=0; x < [self columns]; x++) 
	{
		for(int y=0; y < [self rows]; y++) 
		{
			board[x][y] = [[Cell alloc] init];
		}
	}
	
	return self;
}

-(int) rows
{
	return ROWS;
}

-(int) columns
{
	return COLUMNS;
}

-(Cell *) getCellAt: (int) x by: (int) y 
{
	return board[x][y];
}

-(void)copyBoard: (id<BoardProtocol>)originalBoard 
{
	for(int x=0; x < [self columns]; x++) 
	{
		for(int y=0; y < [self rows] ; y++) 
		{
			if([originalBoard isCellAliveAt: x by: y])
			{
				[self bringToLifeAt: x by: y];
			}
		}
	}
}

-(bool) isCellAliveAt: (int) x by: (int) y 
{
	if(x >= [self rows] || y >= [self columns] || x < 0 || y < 0) 
	{
		return false;
	}
	
	return [board[x][y] alive];
}

-(void) bringToLifeAt: (int) x by: (int) y 
{
	board[x][y].alive = true;
}

-(void) killCellAt: (int) x by: (int) y 
{
	board[x][y].alive = false;
}

-(void) clear
{
	for(int x=0; x < [self columns]; x++) 
	{
		for(int y=0; y < [self rows] ; y++) 
		{
			[self killCellAt: x by: y];
		}
	}
}

-(int)livingNeighborsAt: (int) x by: (int) y 
{
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
