#import "MockGame.h"


@implementation MockGame

-(id) init
{
	itsStartCalls = [[NSMutableSet alloc] init];
	return self;
}

-(bool) startedGameWith: (id<BoardProtocol>) board
{
	return [itsStartCalls containsObject: [NSString stringWithFormat:@"%@", board]];;
}

-(void) start: (id<BoardProtocol>) board
{	
	[itsStartCalls addObject:[NSString stringWithFormat:@"%@", board]];
}

- (void)dealloc 
{
	[NSMutableSet release];
	[super dealloc];
}

@end
