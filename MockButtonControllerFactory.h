//
//  MockButtonControllerFactory.h
//  GameOfLife
//
//  Created by Eric Smith on 1/10/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonControllerFactoryProtocol.h"

@interface MockButtonControllerFactory : NSObject<ButtonControllerFactoryProtocol> {
	NSMutableSet			*itsCreateCalls;
	ButtonController	*itsViewController;
}

-(bool) calledWith: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect;

@end
