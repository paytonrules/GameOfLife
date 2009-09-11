#import "RulesController.h"

@implementation RulesController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ([[touches anyObject] tapCount] > 0)
	{
		[self.parentViewController dismissModalViewControllerAnimated:YES];
	}
}

-(IBAction) goToWikipedia:(id) sender
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://en.m.wikipedia.org/wiki/Conway%27s_Game_of_Life"]];
}

@end
