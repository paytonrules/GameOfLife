#import "ButtonController.h"

@implementation ButtonController
@synthesize X;
@synthesize Y;
@synthesize owner;

- (id) initWithX: (int) x Y: (int) y owner: (id) newOwner {
	self.X = x;
	self.Y = y;
	self.owner = newOwner;
	return self;
}

-(void)bringToLife: (id)sender {
	[owner bringToLifeAt:X Y:Y];
	
	[(UIButton *)self.view removeTarget:self action:@selector(bringToLife:) forControlEvents:UIControlEventTouchUpInside];
	[(UIButton *)self.view addTarget:self action: @selector(kill:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)kill: (id)sender {
	[owner killAt: X Y: Y];
	
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
