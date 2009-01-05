//
//  GameOfLifeViewController.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLBoard.h"
#import "ConcreteButtonControllerFactory.h"

@interface GameOfLifeViewController : UIViewController {
	GOLBoard																	*board;
	IBOutlet ConcreteButtonControllerFactory	*buttonFactory;
}

@property(nonatomic, retain) GOLBoard *board;
@property(nonatomic, retain) ConcreteButtonControllerFactory *buttonFactory;

+ (float) calculatePositionFor: (float) rowOrColumn;
@end

