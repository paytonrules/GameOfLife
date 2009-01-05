//
//  GameOfLifeViewControllerTest.m
//  GameOfLife
//
//  Created by Eric Smith on 12/27/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import "GameOfLifeViewController.h"
#import "CellButton.h"
#import "GameOfLifeViewControllerTest.h"
#import "ConcreteButtonControllerFactory.h"


@implementation GameOfLifeViewControllerTest

-(void)setUp {
	itsController = [[GameOfLifeViewController alloc] init];
	itsButtonFactory = [[ConcreteButtonControllerFactory alloc] init];
	
	itsController.buttonFactory = itsButtonFactory; 
}

-(void)testHasAllButtons {
	STAssertEquals([[itsController.view subviews] count], (NSUInteger) 225, nil);
}

-(void)testHas15RowsOfButtons {
	for(int row = 0; row < 15; row++)
	{
		UIButton *button = [[itsController.view subviews] objectAtIndex: (row*15)];
		
		STAssertEquals(button.center.y, (float) (10 + (20 * row)), nil);
	}
}

-(void)testHas15ColumnsOfButtons {
	for(int column = 0; column < 15; column++)
	{
		UIButton *button = [[itsController.view subviews] objectAtIndex: column];
		
		STAssertEquals(button.center.x, (float) (10 + (20 * column)), nil);
	}
}

-(void)testSelectCellBringsCellToLife {
	GOLBoard	*board = [[GOLBoard alloc] init];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	itsController.board = board;
	[button setCenter:CGPointMake([GameOfLifeViewController calculatePositionFor: 1], [GameOfLifeViewController calculatePositionFor:1])];	
	
	[itsController selectCell: button];
	
	STAssertTrue([board isCellAliveAt:1 by:1], nil);
}

-(void)testSelectCellKillsCell {
	GOLBoard	*board = [[GOLBoard alloc] init];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[board killCellAt:1	by:1];
	
	itsController.board = board;
	[button setCenter:CGPointMake([GameOfLifeViewController calculatePositionFor: 1], [GameOfLifeViewController calculatePositionFor:1])];	
	
	[itsController selectCell: button];
	
	STAssertTrue([board isCellAliveAt:1 by:1], nil);
}
@end
