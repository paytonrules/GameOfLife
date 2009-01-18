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

-(void)setUp {
	itsController = [[GameOfLifeViewController alloc] init];
	itsFactory = [[MockButtonControllerFactory alloc] init];
	itsBoard = [[MockBoard alloc] init];
	
	itsController.buttonFactory = itsFactory;
	itsController.board = itsBoard;
}

-(void) tearDown {
	[itsFactory release];
	[itsBoard release];
	[itsController release];
}

-(void)testHasAllButtons {
	STAssertEquals([[itsController.view subviews] count], (NSUInteger) 225, nil);
}

-(void)testHasAllCells {
	
	for(int x = 0; x < 15; x++) {
		for(int y = 0; y < 15; y++) {
			// Duplication - me no like
			CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: x], [GameOfLifeViewController calculatePositionFor: y]);
			CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);

			STAssertTrue([itsFactory calledWith:[itsController.board getCellAt: x by: y] at:point sizeOf:rect], @"Factory not called with %d, %d", x, y);
		}
	}
}


@end
