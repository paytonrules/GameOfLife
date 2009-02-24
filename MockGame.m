#import "MockGame.h"


@implementation MockGame

-(id) init
{
	itsStartCalls = [[NSMutableSet alloc] init];
	advanceGenerationCalled = false;
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

- (void)dealloc 
{
	[NSMutableSet release];
	[super dealloc];
}

@end
