
#import <UIKit/UIKit.h>
#import "BoardProtocol.h"
#import "ButtonControllerFactoryProtocol.h"
#import "GameProtocol.h"
#import "GameRunnerProtocol.h"

@interface GameOfLifeViewController : UIViewController {
	IBOutlet NSObject<BoardProtocol> *board;
	IBOutlet NSObject<ButtonControllerFactoryProtocol>	*buttonFactory;
	IBOutlet NSObject<GameProtocol> *game;
	IBOutlet NSObject<GameRunnerProtocol> *gameRunner;
	IBOutlet UIViewController *rulesViewController;
}

@property(nonatomic, retain) NSObject<BoardProtocol> *board;
@property(nonatomic, retain) NSObject<ButtonControllerFactoryProtocol> *buttonFactory;
@property(nonatomic, retain) NSObject<GameProtocol> *game;
@property(nonatomic, retain) NSObject<GameRunnerProtocol> *gameRunner;
@property(nonatomic, retain) UIViewController *rulesViewController;

+ (float) calculatePositionFor: (float) rowOrColumn;
- (void) start:(id) sender;
- (void) stop: (id) sender;
- (void) showRules: (id) sender;
- (void) clear: (id) sender;


@end

