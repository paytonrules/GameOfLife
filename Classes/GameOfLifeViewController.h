
#import <UIKit/UIKit.h>
#import "BoardProtocol.h"
#import "ButtonControllerFactoryProtocol.h"

@interface GameOfLifeViewController : UIViewController {
	IBOutlet id<BoardProtocol> board;
	IBOutlet id<ButtonControllerFactoryProtocol>	buttonFactory;
}

@property(nonatomic, retain) id<BoardProtocol> board;
@property(nonatomic, retain) id<ButtonControllerFactoryProtocol> buttonFactory;

+ (float) calculatePositionFor: (float) rowOrColumn;

@end

