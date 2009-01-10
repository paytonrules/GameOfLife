//
//  ButtonFactory.h
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonController.h"

@interface ConcreteButtonControllerFactory : NSObject {

}

-(ButtonController*) createButtonControllerForCell: cell at: (CGPoint) point sizeOf: (CGRect) rect;

@end
