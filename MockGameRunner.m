#import "MockGameRunner.h"

@implementation MockGameRunner

-(id) init
{
	startCalled = false;
	stopCalled = false;
	return self;
}

-(void) stop {
	stopCalled = true;
}

-(void) start {
	startCalled = true;
}

-(bool) isStartCalled {
	return startCalled;
}

-(bool) isStopCalled {
	return stopCalled;
}

@end
