#import "MockGame.h"


@implementation MockGame

-(id) init
{
	itsStartCalls = [[NSMutableSet alloc] init];
	advanceGenerationCalled = false;
	startCalled = false;
	stopCalled = false;
	return self;
}

-(void) advanceGeneration
{
	advanceGenerationCalled = true;
}

-(bool) advanceGenerationCalled
{
	return advanceGenerationCalled;
}

-(bool) startCalled
{
	return startCalled;
}

-(void) start
{
	startCalled = true;
}

-(void) stop
{
	stopCalled = true;
}

-(bool)stopCalled
{
	return stopCalled;
}

- (void)dealloc 
{
	[NSMutableSet release];
	[super dealloc];
}

@end
