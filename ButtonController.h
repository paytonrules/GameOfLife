//
//  ButtonController.h
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ButtonController : UIViewController {
	int			 X;
	int			 Y;
}

@property int X;
@property int Y;

-(id) initWithX: (int) x Y: (int) y;

@end
