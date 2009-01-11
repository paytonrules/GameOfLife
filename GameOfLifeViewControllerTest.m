//
//  GameOfLifeViewControllerTest.m
//  GameOfLife
//
//  Created by Eric Smith on 12/27/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import "GameOfLifeViewController.h"
#import "ConcreteButtonControllerFactory.h"
#import "GTMSenTestCase.h"

@interface GameOfLifeViewControllerTest : SenTestCase {
	GameOfLifeViewController* itsController;
}
@end


@implementation GameOfLifeViewControllerTest

-(void)setUp {
	itsController = [[GameOfLifeViewController alloc] init];
	
	itsController.buttonFactory = [[ConcreteButtonControllerFactory alloc] init]; 
}

-(void)testHasAllButtons {
//	STAssertEquals([[itsController.view subviews] count], (NSUInteger) 225, nil);
}

@end
