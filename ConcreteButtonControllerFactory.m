//
//  ButtonFactory.m
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "ConcreteButtonControllerFactory.h"

@implementation ConcreteButtonControllerFactory

-(ButtonController*) createButtonControllerForCell: cell at: (CGPoint) point sizeOf: (CGRect) rect;
{
	ButtonController *controller = [[ButtonController alloc] initWithCell:cell];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:rect]; 
	[button setCenter:point];
	[button addTarget:controller action:@selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];

	controller.view = button;
	return controller;
}

@end
