#import "GameOfLifeViewController.h"

@implementation GameOfLifeViewController

@synthesize board, buttonFactory, game, gameRunner, rulesView, gameView;

+ (float) calculatePositionFor: (float) rowOrColumn 
{
	return 10.0f + (20.0f * rowOrColumn);
}

- (void)viewDidLoad
{
	[self.view insertSubview:gameView atIndex:0];
}

- (void)loadView 
{
	[super loadView];
	
	for (int row = 0; row < [board rows]; row++) 
	{
		for (int column = 0; column < [board columns]; column++)
		{
			CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: row], [GameOfLifeViewController calculatePositionFor: column]+50.0f);
			CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
		 
			ButtonController *controller = [self.buttonFactory createButtonControllerForCell:[board getCellAt:row by:column] at:point sizeOf:rect];
			
			[gameView addSubview: controller.view];
		}
	}
}

- (IBAction) start: (id) sender
{
	[gameRunner start];
	
	UIButton *button = (UIButton *)sender;

	[button setTitle:@"Stop" forState:UIControlStateNormal];
	[button removeTarget:nil action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
	[button addTarget:nil action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)stop: (id) sender
{
	[gameRunner stop];

	UIButton *button = (UIButton *)sender;
	[button setTitle:@"Start" forState:UIControlStateNormal];
	[button removeTarget:nil action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
	[button addTarget:nil action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clear: (id) sender
{
	[board clear];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

-(IBAction) showRules: (id) sender
{
	[self.gameView removeFromSuperview];
	[self.view insertSubview:rulesView atIndex: 0];
}

- (void)dealloc 
{
	[rulesView release];
	[gameView release];
	[game release];
	[board release];
	[buttonFactory release];
	[super dealloc];
}
@end
