#import <UIKit/UIKit.h>
#import "GameProtocol.h"
#import "BoardProtocol.h"

@interface MockGame : NSObject<GameProtocol> {
	NSMutableSet *itsStartCalls;
	bool advanceGenerationCalled;
	bool startCalled;
	bool stopCalled;
}

-(bool) advanceGenerationCalled;
-(bool) startCalled;
-(bool) stopCalled;

@end
