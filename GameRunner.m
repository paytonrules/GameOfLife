#import "GameRunner.h"

@implementation GameRunner

@synthesize game;
@synthesize timer;
@synthesize interval;

-(id) init {
	if (self = [super init] ) {
		interval = 0.25;
	}
	return self;
}

-(id) initWithGame: (NSObject<GameProtocol>*) newGame {
	[self init];
	self.game = newGame;
	return self;
}

-(void) start {
	timer = [[NSTimer scheduledTimerWithTimeInterval: interval target:game selector:@selector(advanceGeneration) userInfo:nil repeats:true] retain];
	NSLog(@"%@", timer);
}

-(void) stop {
	[timer invalidate];
}

-(void) dealloc {
	[game release];
	[timer release];
	[super dealloc];
}

@end
