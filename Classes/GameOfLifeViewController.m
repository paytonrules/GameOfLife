#import "GameOfLifeViewController.h"

@implementation GameOfLifeViewController

@synthesize board, buttonFactory;

+ (float) calculatePositionFor: (float) rowOrColumn 
{
	return 10.0f + (20.0f * rowOrColumn);
}

- (void)loadView 
{
	[super loadView];
	
	for (int row = 0; row < [board columns]; row++) 
	{
		for (int column = 0; column < [board rows]; column++)
		{
			// TODO!  Refactor these out so you can mock test.
			CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: row], [GameOfLifeViewController calculatePositionFor: column]);
			CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
		  
			[self.view addSubview: [self.buttonFactory createButtonControllerForCell:[board getCellAt:row by:column] at:point sizeOf:rect].view];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

- (void)dealloc {
	[super dealloc];
}
@end
