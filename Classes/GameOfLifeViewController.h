
#import <UIKit/UIKit.h>
#import "BoardProtocol.h"
#import "ButtonControllerFactoryProtocol.h"
#import "GameProtocol.h"

@interface GameOfLifeViewController : UIViewController {
	IBOutlet NSObject<BoardProtocol> *board;
	IBOutlet NSObject<ButtonControllerFactoryProtocol>	*buttonFactory;
	IBOutlet NSObject<GameProtocol> *game;
}

@property(nonatomic, retain) NSObject<BoardProtocol> *board;
@property(nonatomic, retain) NSObject<ButtonControllerFactoryProtocol> *buttonFactory;
@property(nonatomic, retain) NSObject<GameProtocol> *game;

+ (float) calculatePositionFor: (float) rowOrColumn;
- (void) start:(id) sender;

@end

