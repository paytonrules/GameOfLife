#import "ConcreteButtonControllerFactory.h"

@implementation ConcreteButtonControllerFactory

-(ButtonController*) createButtonControllerForCell: (id) cell at: (CGPoint) point sizeOf: (CGRect) rect;
{
	ButtonController *controller = [[ButtonController alloc] initWithCell:cell];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setFrame:rect]; 
	[button setCenter:point];
	[button setImage:[UIImage imageNamed:@"dead_cell.png"] forState:UIControlStateNormal];

	[button addTarget:controller action:@selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];

	controller.view = button;
	return controller;
}

@end
