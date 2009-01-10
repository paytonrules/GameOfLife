
#import <UIKit/UIKit.h>
#import "GOLBoard.h"
#import "ConcreteButtonControllerFactory.h"

@interface GameOfLifeViewController : UIViewController {
	GOLBoard																	*board;
	IBOutlet ConcreteButtonControllerFactory	*buttonFactory;
}

@property(nonatomic, retain) GOLBoard *board;
@property(nonatomic, retain) ConcreteButtonControllerFactory *buttonFactory;

+ (float) calculatePositionFor: (float) rowOrColumn;

@end

