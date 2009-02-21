//
//  GOLBoard.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardProtocol.h"

@interface GOLBoard : NSObject <BoardProtocol> {
	int sideLength;
	Cell *board[15][15];
}
@end
