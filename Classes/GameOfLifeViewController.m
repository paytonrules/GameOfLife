#import "GameOfLifeViewController.h"

@implementation GameOfLifeViewController

@synthesize board, buttonFactory, game;

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
			CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: row], [GameOfLifeViewController calculatePositionFor: column]);
			CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
		  
			[self.view addSubview: [self.buttonFactory createButtonControllerForCell:[board getCellAt:row by:column] at:point sizeOf:rect].view];
		}
	}
}

- (void) start: (id) sender
{
	[game start];
	
	UIButton *button = (UIButton *)sender;
	[button setTitle:@"Stop" forState:UIControlStateNormal];
	[button removeTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
	[button addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) stop: (id) sender
{
	[game stop];
	
	UIButton *button = (UIButton *)sender;
	[button setTitle:@"Start" forState:UIControlStateNormal];
	[button removeTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
	[button addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) advance: (id) sender
{
	[game advanceGeneration];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

- (void)dealloc 
{
	[game release];
	[board release];
	[buttonFactory release];
	[super dealloc];
}
@end
