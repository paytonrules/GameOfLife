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

@interface GOLBoard : NSObject <Board> {
	int sideLength;
	id<CellProtocol> board[15][15];
}
@end
