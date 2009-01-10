
#import <UIKit/UIKit.h>
#import "CellProtocol.h"

@interface ButtonController : UIViewController {
	id<CellProtocol>	cell;
}

@property(nonatomic, retain) id<CellProtocol> cell;

-(id) initWithCell: (id) newOwner;
-(void)bringToLife: (id) sender;
-(void)kill: (id)sender;

@end
