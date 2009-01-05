//
//  ButtonFactoryTest.m
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "ConcreteButtonControllerFactoryTest.h"

@implementation ConcreteButtonControllerFactoryTest

-(void) setUp {
	itsFactory = [[ConcreteButtonControllerFactory alloc] init];
	itsPoint = CGPointMake(1.0f, 2.0f);
	itsRect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
	itsController = [itsFactory createButtonControllerForX: 1 Y:2 at:itsPoint sizeOf: itsRect];
}

-(void) tearDown {
	[itsFactory release];
	[itsController release];
}

-(void)testCanBeCreated {
	STAssertNotNil(itsFactory, nil);
}

-(void)testCreatesButtonController {
	STAssertNotNil(itsController, nil);
}

-(void)testAssignsButtonControllerXandY {
	STAssertEquals(1, itsController.X, nil);
	STAssertEquals(2, itsController.Y, nil);
}

-(void)testAssignsItsView {
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertEquals(button.frame.size.width, 20.0f,nil);
	STAssertEquals(button.frame.size.height, 20.0f,nil);
	STAssertEquals(button.center.x, 1.0f, nil);
	STAssertEquals(button.center.y, 2.0f, nil);
}

-(void)testAssignsActionToView {
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"selectCell:"], nil);
}
@end
