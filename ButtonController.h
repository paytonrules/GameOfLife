#import <UIKit/UIKit.h>
#import <Foundation/NSKeyValueCoding.h>
#import "ImageFactory.h"
#import "Cell.h"

@interface ButtonController : UIViewController {
	Cell										*cell;
	NSObject<ImageFactory>	*imageFactory;
	IBOutlet UIImage				*deadCell;
	IBOutlet UIImage				*aliveCell;
}

@property(readonly) Cell *cell;
@property(nonatomic, retain) NSObject<ImageFactory> *imageFactory;

-(id) initWithCell: (id) newCell at: (CGPoint) point sizeOf: (CGRect) rect;
-(void) bringToLife: (id) sender;
-(void) kill: (id)sender;
-(void) makeButtonAlive;
-(void) makeButtonDead;

@end
