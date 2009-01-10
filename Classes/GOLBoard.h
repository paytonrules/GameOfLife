//
//  GOLBoard.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "CellProtocol.h"

@interface GOLBoard : Board {
	int sideLength;
	id<CellProtocol> board[15][15];
}

-(void) copyBoard: (GOLBoard*)board;
-(bool) isCellAliveAt: (int) x by: (int) y;
-(void) bringToLifeAt: (int) x by: (int) y;
-(void) killCellAt: (int) x by: (int) y;
-(int) livingNeighborsAt: (int) x by: (int) y;
-(id<CellProtocol>) getCellAt: (int) x by: (int) y;

@end
