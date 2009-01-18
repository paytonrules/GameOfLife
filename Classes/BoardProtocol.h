#import "CellProtocol.h"

@protocol BoardProtocol
	-(void) copyBoard: (id<BoardProtocol>)board;
	-(bool) isCellAliveAt: (int) x by: (int) y;
	-(void) bringToLifeAt: (int) x by: (int) y;
	-(void) killCellAt: (int) x by: (int) y;
	-(int) livingNeighborsAt: (int) x by: (int) y;
	-(id<CellProtocol>) getCellAt: (int) x by: (int) y;
@end


