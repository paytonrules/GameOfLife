#import <UIKit/UIKit.h>
#import <Foundation/NSKeyValueCoding.h>
#import "ImageFactory.h"
#import "Cell.h"

@interface ButtonController : UIViewController {
	Cell				 *cell;
	NSObject<ImageFactory> *imageFactory;
}

@property(readonly) Cell *cell;
@property(nonatomic, retain) NSObject<ImageFactory> *imageFactory;

-(id) initWithCell: (id) newOwner;
-(void) bringToLife: (id) sender;
-(void) kill: (id)sender;
-(void) makeButtonAlive;
-(void) makeButtonDead;

@end
