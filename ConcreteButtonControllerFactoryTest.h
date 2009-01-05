//
//  ButtonFactoryTest.h
//  GameOfLife
//
//  Created by Eric Smith on 1/4/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "GTMSenTestCase.h"
#import "ConcreteButtonControllerFactory.h"

@interface ConcreteButtonControllerFactoryTest : SenTestCase {
	ConcreteButtonControllerFactory *itsFactory;
	ButtonController				*itsController;
	CGPoint									itsPoint;
	CGRect									itsRect;
}

@end
