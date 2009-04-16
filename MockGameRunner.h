#import <UIKit/UIKit.h>
#import "GameRunnerProtocol.h"

@interface MockGameRunner : NSObject<GameRunnerProtocol> {
	bool stopCalled;
	bool startCalled;
}

-(bool) isStartCalled;
-(bool) isStopCalled;

@end
