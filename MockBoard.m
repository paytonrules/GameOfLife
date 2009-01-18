#import "MockBoard.h"
@implementation MockBoard

-(id) init
{
	[super init];
	itsCell = [[MockCell alloc] init];
	return self;
}	

-(void) copyBoard: (id<BoardProtocol>)board 
{
}

-(bool) isCellAliveAt: (int) x by: (int) y
{
	return true;
}

-(void) bringToLifeAt: (int) x by: (int) y 
{
}

-(void) killCellAt: (int) x by: (int) y 
{
}

-(int) livingNeighborsAt: (int) x by: (int) y 
{
	return 0;
}

-(id<CellProtocol>) getCellAt: (int) x by: (int) y
{
	return itsCell;
}

- (void)dealloc 
{
	[itsCell release];
	[super dealloc];
}
@end
