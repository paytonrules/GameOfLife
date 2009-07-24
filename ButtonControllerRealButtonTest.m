#import <SenTestingKit/SenTestingKit.h>
#import "ButtonController.h"

@interface ButtonControllerRealButtonTest : SenTestCase {
	
}

@end

@implementation ButtonControllerRealButtonTest

-(void) testButtonPropertiesOnCreation {
	Cell *cell = [[Cell alloc] init];
	CGPoint point = CGPointMake(1.0f, 2.0f);
	CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
	ButtonController *controller = [[ButtonController alloc] initWithCell: cell at: point sizeOf: rect];
	
	UIButton *button = (UIButton *) controller.view;
	STAssertEquals(button.frame.size.width, 20.0f,nil);
	STAssertEquals(button.frame.size.height, 20.0f,nil);
	STAssertEquals(button.center.x, 1.0f, nil);
	STAssertEquals(button.center.y, 2.0f, nil);
	
	[cell release];
	[controller release];
}


@end
