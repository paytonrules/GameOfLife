//
//  GOLBoard.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"

@interface GOLBoard : Board {
	int sideLength;
	bool board[15][15];
}

-(bool)isCellAliveAt: (int) x by: (int) y;
-(void)bringToLifeAt: (int) x by: (int) y;
-(void)killCellAt: (int) x by: (int) y;
-(int)livingNeighborsAt: (int) x by: (int) y;

@end
