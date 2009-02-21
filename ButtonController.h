
#import <UIKit/UIKit.h>
#import <Foundation/NSKeyValueCoding.h>
#import "Cell.h"

@interface ButtonController : UIViewController {
	Cell	*cell;
}

@property(readonly) Cell *cell;

-(id) initWithCell: (id) newOwner;
-(void)bringToLife: (id) sender;
-(void)kill: (id)sender;

@end
