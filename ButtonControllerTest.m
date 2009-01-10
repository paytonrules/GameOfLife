#import "GTMSenTestCase.h"
#import "ButtonController.h"
#import "MockCell.h"

@interface ButtonControllerTest : SenTestCase {
	ButtonController	*itsController;
	MockCell					*itsCell;
}
@end


@implementation ButtonControllerTest

-(void) setUp {
	itsCell = [[MockCell alloc] init];
	itsController = [[ButtonController alloc] initWithCell: itsCell];
	itsController.view = [UIButton buttonWithType:UIButtonTypeRoundedRect];
}

-(void) tearDown {
	[itsCell release];
	[itsController release];
}

-(void) testCustomInit {	
	STAssertEquals(itsCell, itsController.cell, nil);
}

-(void) testBringToLifeRessurect {
	[itsController bringToLife: nil];
	
	STAssertTrue(itsCell.resurrected, nil);
}

-(void) testBringToLifeChangesButtonsActionToKill {
	[itsController bringToLife: nil];
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"kill:"], nil);
}

-(void) testKillCallsKill {
	[itsController kill: nil];
	
	STAssertTrue(itsCell.killed, nil);
}

-(void) testKillSwitchesActionToBringToLife {
	[itsController kill : nil];
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
}
@end
