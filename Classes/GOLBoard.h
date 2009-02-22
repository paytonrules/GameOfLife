//
//  GOLBoard.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardProtocol.h"

#define COLUMNS 16
#define ROWS 18

@interface GOLBoard : NSObject <BoardProtocol> {
	Cell *board[COLUMNS][ROWS];
}
@end
