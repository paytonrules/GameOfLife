#import "ConcreteButtonControllerFactory.h"

@implementation ConcreteButtonControllerFactory

-(ButtonController*) createButtonControllerForCell: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect;
{
	ButtonController *controller = [[ButtonController alloc] initWithCell:cell at: point sizeOf: rect];
	
	return controller;
}

@end
