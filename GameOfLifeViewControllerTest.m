//
//  GameOfLifeViewControllerTest.m
//  GameOfLife
//
//  Created by Eric Smith on 12/27/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import "GameOfLifeViewController.h"
#import "GameOfLifeViewControllerTest.h"
#import "ConcreteButtonControllerFactory.h"


@implementation GameOfLifeViewControllerTest

-(void)setUp {
	itsController = [[GameOfLifeViewController alloc] init];
	
	itsController.buttonFactory = [[ConcreteButtonControllerFactory alloc] init]; 
}

-(void)testHasAllButtons {
	STAssertEquals([[itsController.view subviews] count], (NSUInteger) 225, nil);
}

//-(void)testSelectCellBringsCellToLife {
//	GOLBoard	*board = [[GOLBoard alloc] init];
//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	
//	itsController.board = board;
//	[button setCenter:CGPointMake([GameOfLifeViewController calculatePositionFor: 1], [GameOfLifeViewController calculatePositionFor:1])];	
//	
//	[itsController selectCell: button];
//	
//	STAssertTrue([board isCellAliveAt:1 by:1], nil);
//}
//
//-(void)testSelectCellKillsCell {
//	GOLBoard	*board = [[GOLBoard alloc] init];
//	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	[board killCellAt:1	by:1];
//	
//	itsController.board = board;
//	[button setCenter:CGPointMake([GameOfLifeViewController calculatePositionFor: 1], [GameOfLifeViewController calculatePositionFor:1])];	
//	
//	[itsController selectCell: button];
//	
//	STAssertTrue([board isCellAliveAt:1 by:1], nil);
//}
@end
