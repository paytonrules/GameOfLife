#import "MockButtonControllerFactory.h"

@implementation MockButtonControllerFactory

-(id) init 
{
	[super init];
	itsCreateCalls = [[NSMutableSet alloc] init];
	return self;
}

-(void) dealloc 
{
	[itsViewController release];
	[super dealloc];
}

+(NSString *) createStringFrom: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect 
{
	return [NSString stringWithFormat:@"%@ %d.%d %d", cell, point.x, point.y, rect.size];
}

-(ButtonController*) createButtonControllerForCell: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect	
{
	[itsCreateCalls addObject:[MockButtonControllerFactory createStringFrom:cell at:point sizeOf:rect]];
	
	itsViewController = [[ButtonController alloc] init];
	
	UIButton* button = [[UIButton alloc] init];
	itsViewController.view = button;
	[button release];
	
	return itsViewController;
}

-(bool) calledWith: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect 
{
	NSLog(@"Cell was: %@", cell);
	return [itsCreateCalls containsObject: [MockButtonControllerFactory createStringFrom:cell at:point sizeOf:rect]];
}
@end
