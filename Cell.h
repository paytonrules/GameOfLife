//
//  Cell.h
//  GameOfLife
//
//  Created by Eric Smith on 1/10/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellProtocol.h"


@interface Cell : NSObject<CellProtocol> {
	bool alive;
}

@property(readonly) bool alive;
@end
