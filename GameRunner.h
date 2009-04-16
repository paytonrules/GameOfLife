#import <UIKit/UIKit.h>
#import "GameProtocol.h"
#import "GameRunnerProtocol.h"

@interface GameRunner : NSObject<GameRunnerProtocol> {
	IBOutlet NSObject<GameProtocol>	*game;
	NSTimer									*timer;
	NSTimeInterval					interval;
}

-(id) initWithGame:(NSObject<GameProtocol>*) newGame;
-(void) start;

@property(nonatomic, retain) NSObject<GameProtocol> *game;
@property(readonly) NSTimer *timer;
@property NSTimeInterval interval;

@end
