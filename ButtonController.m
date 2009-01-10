#import "ButtonController.h"

@implementation ButtonController
@synthesize cell;

- (id) initWithCell: (id) newCell {
	cell = newCell;
	return self;
}

-(void)bringToLife: (id)sender {
	[cell resurrect];
	
	[(UIButton *)self.view removeTarget:self action:@selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view addTarget:self action: @selector(kill:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)kill: (id)sender {
	[cell kill];
	
	[(UIButton *)self.view removeTarget:self action:@selector(kill:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view addTarget:self action: @selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
