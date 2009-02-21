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
	[itsCreateCalls release];
	[super dealloc];
}

+(NSString *) createStringFrom: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect 
{	
	return [NSString stringWithFormat:@"%@ %f %f %f %f", cell, point.x, point.y, rect.size.width, rect.size.height];
}

-(ButtonController*) createButtonControllerForCell: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect	
{
		[itsCreateCalls addObject:[MockButtonControllerFactory createStringFrom:cell at:point sizeOf:rect]];
	
	itsViewController = [[ButtonController alloc] init];
	
	// Not liking this - want a mock.  It's a demeter problem - the controller has to add the view.
	UIButton* button = [[UIButton alloc] init];
	itsViewController.view = button;
	[button release];
	
	return itsViewController;
}

-(bool) calledWith: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect 
{
	return [itsCreateCalls containsObject: [MockButtonControllerFactory createStringFrom:cell at:point sizeOf:rect]];
}
@end
