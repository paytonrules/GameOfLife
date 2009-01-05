//
//  GameOfLifeViewControllerTest.h
//  GameOfLife
//
//  Created by Eric Smith on 12/27/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import "GTMSenTestCase.h"
#import "MockButtonFactory.h"

@interface GameOfLifeViewControllerTest : SenTestCase {
	GameOfLifeViewController* itsController;
	MockButtonFactory*				itsButtonFactory;
}

@end
