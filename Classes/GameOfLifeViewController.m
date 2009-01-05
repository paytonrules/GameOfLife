//
//  GameOfLifeViewController.m
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "GameOfLifeViewController.h"

@implementation GameOfLifeViewController

@synthesize board;

+ (float) calculatePositionFor: (float) rowOrColumn {
	return 10.0f + (20.0f * rowOrColumn);
}

+ (float) calculateIndexFromPosition: (float) position {
	return (position - 10.0f) / 20.f;
}

- (void) addNewButtonAtRow: (float) row column: (float) column  {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];

	[button setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
	[button setCenter:CGPointMake([GameOfLifeViewController calculatePositionFor: column], [GameOfLifeViewController calculatePositionFor:row])];
	[button addTarget:self action:@selector(selectCell:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)loadView {
	[super loadView];
	
	for (int row = 0; row < 15; row++) {
		for (int column = 0; column < 15; column++)
		{
			[self addNewButtonAtRow: row column: column];
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
}

- (void)dealloc {
    [super dealloc];
}

- (IBAction) selectCell: (id) sender {
	
	UIButton *button = (UIButton *)sender;
	
	[board bringToLifeAt:[GameOfLifeViewController calculateIndexFromPosition: button.center.x] by:[GameOfLifeViewController calculateIndexFromPosition: button.center.y]];
}

@end
