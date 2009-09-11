#import "RulesController.h"
#import "RulesControllerTest.h"

#define typeof __typeof__ // This is needed to use OCMOCK_VALUE

@implementation RulesControllerTest

-(void) setUp
{
	parentViewController = [OCMockObject mockForClass: [UIViewController class]];
	rulesController = [[RulesController alloc] init];
	rulesMock = [OCMockObject partialMockForObject:rulesController];
	[[[rulesMock stub] andReturn: parentViewController] parentViewController];
}

-(void) tearDown
{
	[rulesController release];
}

// Yet another lame test - I really need to figure this out.
-(void) testDissmissesOnTap
{
	OCMockObject *mockTouch = [OCMockObject mockForClass:[UITouch class]];
	NSUInteger numTaps = 1;
	[[[mockTouch stub] andReturnValue:OCMOCK_VALUE(numTaps)] tapCount];
	NSSet *touches = [NSSet setWithObject:mockTouch];
	
	[[parentViewController expect] dismissModalViewControllerAnimated:YES];
	
	[rulesController touchesBegan:touches withEvent:nil];
	
	[parentViewController verify];
}

-(void) testOnlyDismissesIfThereIsATap
{	
	OCMockObject *mockTouch = [OCMockObject mockForClass:[UITouch class]];
	NSUInteger numTaps = 0;
	[[[mockTouch stub] andReturnValue:OCMOCK_VALUE(numTaps)] tapCount];
	NSSet *touches = [NSSet setWithObject:mockTouch];
	
	[rulesController touchesBegan:touches withEvent:nil];
	
	[parentViewController verify];
}

-(void) testGoToWikipediaLaunchesURL
{
	UIApplication *app = [UIApplication sharedApplication];
	OCMockObject *partialAppMock = [OCMockObject partialMockForObject:app];
	
	[[partialAppMock expect] openURL:[NSURL URLWithString:@"http://en.m.wikipedia.org/wiki/Conway%27s_Game_of_Life"]];
	
	[rulesController goToWikipedia:nil];
	
	[partialAppMock verify];
}

@end
