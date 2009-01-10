
#import <UIKit/UIKit.h>
#import "BoardProtocol.h"

@interface ButtonController : UIViewController {
	int								X;
	int								Y;
	id<BoardProtocol>	owner;
}

@property int X;
@property int Y;
@property(nonatomic, retain) id<BoardProtocol> owner;

-(id) initWithX: (int) x Y: (int) y owner: (id) newOwner;
-(void)bringToLife: (id)sender;
-(void)kill: (id)sender;

@end
