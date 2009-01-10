#import <UIKit/UIKit.h>
#import "CellProtocol.h"

@interface MockCell : NSObject<CellProtocol> {
	bool resurrected;
	bool killed;
}

@property(readonly) bool resurrected;
@property(readonly) bool killed;

@end
