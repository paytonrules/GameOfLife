//
//  Game.h
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLBoard.h"
#import "BoardProtocol.h"

@interface Game : NSObject {
	id<BoardProtocol> myBoard;
}

-(id<BoardProtocol>) board;
-(void)setBoard:(id<BoardProtocol>) board;
-(void)advanceGeneration;

@end
