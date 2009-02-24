#import <UIKit/UIKit.h>
#import "GameProtocol.h"
#import "BoardProtocol.h"

@interface MockGame : NSObject<GameProtocol> {
	NSMutableSet *itsStartCalls;
}

-(bool) startedGameWith: (id<BoardProtocol>) board;

@end
