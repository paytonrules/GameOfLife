//
//  GameOfLifeViewController.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOLBoard.h"

@interface GameOfLifeViewController : UIViewController {
	GOLBoard *board;
}

@property(nonatomic, retain) GOLBoard *board;

- (IBAction) selectCell: (id) sender;
+ (float) calculatePositionFor: (float) rowOrColumn;
@end

