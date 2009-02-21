#import <UIKit/UIKit.h>
#import "BoardProtocol.h"
#import "Cell.h"

@interface MockBoard : NSObject<BoardProtocol> 
{
	Cell	*itsCell;
}

@end
