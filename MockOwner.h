//
//  MockOwner.h
//  GameOfLife
//
//  Created by Eric Smith on 1/5/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardProtocol.h"

@interface MockOwner : NSObject<BoardProtocol> {
	int itsX;
	int itsY;
	bool bringToLifeAtCalled;
	bool killCalled;
}

-(bool) bringToLifeAtCalledWithX: (int) x Y: (int) y;
-(bool) killAtCalledWithX: (int) x Y: (int) y;

@end
