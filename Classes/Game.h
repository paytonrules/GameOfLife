//
//  Game.h
//  GameOfLife
//
//  Created by Eric Meyer on 12/22/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLBoard.h"

@interface Game : NSObject {
	Board* myBoard;
}

-(Board*)board;
-(void)setBoard:(Board*) board;
-(void)advanceGeneration;

@end
