#import <UIKit/UIKit.h>
#import "BoardProtocol.h"
#import "MockCell.h"

@interface MockBoard : NSObject<BoardProtocol> 
{
	MockCell	*itsCell;
}

@end
