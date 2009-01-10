//
//  ButtonFactory.m
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "ConcreteButtonControllerFactory.h"

@implementation ConcreteButtonControllerFactory

-(ButtonController*) createButtonControllerForX: (int) x Y: (int) y at: (CGPoint) point sizeOf: (CGRect) rect 
{
	ButtonController *controller = [[ButtonController alloc] initWithX: x Y: y owner: nil];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:rect]; 
	[button setCenter:point];
	[button addTarget:controller action:@selector(selectCell:) forControlEvents:UIControlEventTouchUpInside];

	controller.view = button;
	return controller;
}

@end
