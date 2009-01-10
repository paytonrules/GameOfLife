#import "GTMSenTestCase.h"
#import "ButtonController.h"
#import "MockOwner.h"

@interface ButtonControllerTest : SenTestCase {
	ButtonController	*itsController;
	MockOwner					*itsOwner;
}
@end


@implementation ButtonControllerTest

-(void) setUp {
	itsOwner = [[MockOwner alloc] init];
	itsController = [[ButtonController alloc] initWithX: 123 Y: 456 owner: itsOwner];
	itsController.view = [UIButton buttonWithType:UIButtonTypeRoundedRect];
}

-(void) tearDown {
	[itsOwner release];
	[itsController release];
}

-(void) testCustomInit {	
	STAssertEquals(123, itsController.X, nil);
	STAssertEquals(456, itsController.Y, nil);
	STAssertEquals(itsOwner, itsController.owner, nil);
}

-(void) testBringToLifeCallsOwnerBringToLife {
	[itsController bringToLife: nil];
	
	STAssertTrue([itsOwner bringToLifeAtCalledWithX: 123 Y: 456], nil);
}

-(void) testBringToLifeChangesButtonsActionToKill {
	[itsController bringToLife: nil];
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"kill:"], nil);
}

-(void) testKillCallsOwnerKillCellAt {
	[itsController kill: nil];
	
	STAssertTrue([itsOwner killAtCalledWithX: 123 Y: 456], nil);
}

-(void) testKillSwitchesActionToBringToLife {
	[itsController kill : nil];
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
}
@end
