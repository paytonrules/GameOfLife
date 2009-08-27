#import "Cell.h"

@protocol BoardProtocol
	-(void) copyBoard: (id<BoardProtocol>)board;
	-(bool) isCellAliveAt: (int) x by: (int) y;
	-(void) bringToLifeAt: (int) x by: (int) y;
	-(void) killCellAt: (int) x by: (int) y;
	-(int) livingNeighborsAt: (int) x by: (int) y;
	-(Cell*) getCellAt: (int) x by: (int) y;
	-(int) rows;
	-(int) columns;
	-(void) clear;
@end


