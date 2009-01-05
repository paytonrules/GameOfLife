#import "ButtonController.h"

@protocol AbstractButtonControllerFactory
	-(ButtonController*) createButtonControllerForX: (int) x Y: (int) y at: (CGPoint) point sizeOf: (CGRect) rect;
@end 