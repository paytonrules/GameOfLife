//
//  ButtonFactoryTest.h
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "GTMSenTestCase.h"

@interface ButtonControllerFactoryTest : SenTestCase {
	ButtonControllerFactory *itsFactory;
	ButtonController				*itsController;
	CGPoint									itsPoint;
	CGRect									itsRect;
}

@end
