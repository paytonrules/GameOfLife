//
//  Board.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Board : NSObject {
	int sideLength;
}

-(bool) isCellAliveAt: (int) x by: (int) y;
-(void) bringToLifeAt: (int) x by: (int) y;

@end
