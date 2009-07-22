#import "ButtonController.h"

@implementation ButtonController
@synthesize cell;
@synthesize imageFactory;

- (id )init
{
	[super init];
	
	return self;
}

- (id) initWithCell: (id) newCell 
{
	[self init];
	cell = newCell;
	[cell retain];
	[cell addObserver:self forKeyPath:@"alive" options:NSKeyValueObservingOptionNew context:NULL];
	return self;
}

- (void) bringToLife: (id)sender 
{
	cell.alive = true;
}

- (void) makeButtonAlive
{
	[(UIButton *)self.view removeTarget:self action:@selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view addTarget:self action: @selector(kill:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view setImage:[imageFactory createFromName:@"alive_cell.png"] forState:UIControlStateNormal];
}

- (void) kill: (id)sender 
{
	cell.alive = false;
}

-(void) makeButtonDead
{
	[(UIButton *)self.view removeTarget:self action:@selector(kill:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view addTarget:self action: @selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view setImage:[imageFactory createFromName:@"dead_cell.png"] forState:UIControlStateNormal];
}	
	
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	bool alive = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
	
	if(alive)
	{
		[self makeButtonAlive];
	}
	else
	{
		[self makeButtonDead];
	}
}

- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc 
{
	[cell removeObserver:self forKeyPath:@"alive"];
	[cell release];
	[imageFactory release];
	[super dealloc];
}


@end
