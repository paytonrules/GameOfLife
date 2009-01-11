//
//  Game.h
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLBoard.h"
#import "Board.h"

@interface Game : NSObject {
	id<Board> myBoard;
}

-(id<Board>)board;
-(void)setBoard:(id<Board>) board;
-(void)advanceGeneration;

@end
