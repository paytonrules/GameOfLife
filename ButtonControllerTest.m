#import "GTMSenTestCase.h"
#import "ButtonController.h"
#import "Cell.h"

@interface ButtonControllerTest : SenTestCase 
{
	ButtonController	*itsController;
	Cell							*itsCell;
	UIButton					*itsButton;
}
@end


@implementation ButtonControllerTest

-(void) setUp 
{
	itsCell = [[Cell alloc] init];
	itsController = [[ButtonController alloc] initWithCell: itsCell];
	itsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	itsController.view = itsButton;
}

-(void) tearDown 
{
	[itsCell release];
	[itsController release];
}

-(void) testCustomInit 
{
	STAssertEquals(itsCell, itsController.cell, nil);
}

-(void) testBringToLifeRessurect 
{
	[itsController bringToLife: nil];
	
	STAssertTrue(itsCell.alive, nil);
}

-(void) testBringToLifeChangesButtonsActionToKill 
{
	[itsController bringToLife: nil];
	
	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"kill:"], nil);
}

-(void) testKillCallsKill 
{
	[itsController kill: nil];
	
	STAssertFalse(itsCell.alive, nil);
}

-(void) testKillSwitchesActionToBringToLife 
{
	[itsController kill : nil];
	
	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
}

-(void) testObserveValueForKeyPathSwitchesButtonAction
{
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithBool:false] forKey: NSKeyValueChangeNewKey];
	
	[itsController observeValueForKeyPath:@"alive" ofObject: itsCell change: dictionary context:nil];

	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
}

-(void) testObserveValueForKeyPathSwitchesButtonActionToKill
{
	itsCell.alive = false;
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithBool:true] forKey: NSKeyValueChangeNewKey];
	
	[itsController observeValueForKeyPath:@"alive" ofObject: itsCell change: dictionary context:nil];
	
	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"kill:"], nil);
}

-(void) testObservingValueOfCellAlive
{
	[itsCell setAlive: false];
	
	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
	
	[itsCell setAlive: true];
	
	STAssertTrue([[itsButton actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"kill:"], nil);
}

-(void) testKillChangesButtonsBackgroundImage
{
	[itsCell setAlive: false];

	UIImage *image = [UIImage imageNamed:@"dead_cell.png"];
	UIImage *imageReal = [itsButton backgroundImageForState:UIControlStateNormal];
	
	STAssertEqualObjects(image, imageReal, nil);
}

-(void) testRessurectChangesButtonsBackgroundImage
{
	[itsCell setAlive: true];
	
	UIImage *image = [UIImage imageNamed:@"alive_cell.png"];
	UIImage *imageReal = [itsButton backgroundImageForState:UIControlStateNormal];
	
	STAssertEqualObjects(image, imageReal, nil);
}


@end
