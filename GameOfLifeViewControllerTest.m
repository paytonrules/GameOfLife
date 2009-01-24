//
//  GameOfLifeViewControllerTest.m
//  GameOfLife
//
//  Created by Eric Smith on 12/27/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import "GameOfLifeViewController.h"
#import "MockButtonControllerFactory.h"
#import "MockBoard.h"
#import "GTMSenTestCase.h"

@interface GameOfLifeViewControllerTest : SenTestCase {
	GameOfLifeViewController *itsController;
	MockButtonControllerFactory *itsFactory;
	MockBoard *itsBoard;
}
@end


@implementation GameOfLifeViewControllerTest

-(void)setUp 
{
	itsController = [[GameOfLifeViewController alloc] init];
	itsFactory = [[MockButtonControllerFactory alloc] init];
	itsBoard = [[MockBoard alloc] init];
	
	itsController.buttonFactory = itsFactory;
	itsController.board = itsBoard;
	[itsController loadView];
}

-(void) tearDown 
{
	[itsFactory release];
	[itsBoard release];
	[itsController release];
}

-(void) testHasAllButtons 
{
	NSArray *subviews = [itsController.view subviews];
	
	int count = [subviews count];
	
	STAssertEquals(count, 225, nil);
}

-(void) testCreatesAllButtonControllers 
{	
	// Mock board should have 1 row, 1 column
	for(int x = 0; x < 15; x++) 
	{
		for(int y = 0; y < 15; y++) 
		{
			// Duplication - me no like
			// Figured it out - this should be a seperate class
			CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: x], [GameOfLifeViewController calculatePositionFor: y]);
			CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);

			STAssertTrue([itsFactory calledWith:[itsController.board getCellAt: x by: y] at:point sizeOf:rect], @"Factory not called with %d, %d", x, y);
		}
	}
}

@end
