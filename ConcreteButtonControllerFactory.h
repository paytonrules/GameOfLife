//
//  ButtonFactory.h
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonController.h"
#import "ButtonControllerFactoryProtocol.h"

@interface ConcreteButtonControllerFactory : NSObject<ButtonControllerFactoryProtocol> {

}

@end
