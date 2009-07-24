#import <SenTestingKit/SenTestingKit.h>
#import <objc/runtime.h>
#import <OCMock/OCMock.h>
#import "ButtonController.h"
#import "Cell.h"
#import "ImageFactory.h"

@interface ButtonControllerTest : SenTestCase 
{
	ButtonController	*itsController;
	Cell							*itsCell;
	OCMockObject			*itsButton;
}
@end

@implementation ButtonControllerTest

-(void) setUp 
{
	itsCell = [[Cell alloc] init];
	itsController = [[ButtonController alloc] initWithCell: itsCell at: CGPointMake(0.0, 0.0) sizeOf: CGRectMake(0.0, 0.0, 0.0, 0.0)];
	itsButton = [OCMockObject niceMockForClass:[UIButton class]];

	itsController.view =	(UIButton *)itsButton;
}

-(void) tearDown 
{
	[itsCell release];
	[itsController release];
}

-(void) testButtonCreated
{

	STAssertNotNil(itsController.view, nil);
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
	[[itsButton expect] addTarget:itsController action:@selector(kill:) forControlEvents:UIControlEventTouchUpInside];
	[itsController bringToLife: nil];
	
	[itsButton verify];
}

-(void) testKillCallsKill 
{
	[itsController kill: nil];
	
	STAssertFalse(itsCell.alive, nil);
}

-(void) testKillSwitchesActionToBringToLife 
{
	[[itsButton expect] addTarget: itsController action:@selector(bringToLife:) forControlEvents: UIControlEventTouchUpInside ];
	[itsController kill : nil];
	
	[itsButton verify];
}

-(void) testObserveValueForKeyPathSwitchesButtonAction
{
	[[itsButton expect] addTarget: itsController action:@selector(bringToLife:) forControlEvents: UIControlEventTouchUpInside];
	
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithBool:false] forKey: NSKeyValueChangeNewKey];
	
	[itsController observeValueForKeyPath:@"alive" ofObject: itsCell change: dictionary context:nil];

	[itsButton verify];
}

-(void) testObserveValueForKeyPathSwitchesButtonActionToKill
{
	[[itsButton expect] addTarget: itsController action:@selector(kill:) forControlEvents: UIControlEventTouchUpInside];
	
	itsCell.alive = false;
	NSDictionary *dictionary = [NSDictionary dictionaryWithObject: [NSNumber numberWithBool:true] forKey: NSKeyValueChangeNewKey];
	
	[itsController observeValueForKeyPath:@"alive" ofObject: itsCell change: dictionary context:nil];

	[itsButton verify];
}

// Not sure this belongs here.  
-(void) testObservingValueOfCellAlive
{
	[[itsButton expect] addTarget: itsController action:@selector(bringToLife:) forControlEvents: UIControlEventTouchUpInside];
	[itsCell setAlive: false];
	[itsButton verify];
	
	[[itsButton expect] addTarget: itsController action:@selector(kill:) forControlEvents: UIControlEventTouchUpInside];	
	[itsCell setAlive: true];
	[itsButton verify];
}

-(void) testKillSwitchesTheViewToTheDeadCell
{	
	id deadCell = [OCMockObject niceMockForClass:[UIImage class]];
	[itsController setValue:deadCell forKey:@"deadCell"];
	
	[[itsButton expect] setImage:deadCell forState:UIControlStateNormal];

	[itsController kill:nil];
	
	[itsButton verify];
}

-(void) testBringToLifeSwitchesTheViewToTheAliveCell
{	
	id aliveCell = [OCMockObject niceMockForClass:[UIImage class]];
	[itsController setValue:aliveCell forKey:@"aliveCell"];

	[[itsButton expect] setImage:aliveCell forState:UIControlStateNormal];
	
	[itsController bringToLife:nil];
	
	[itsButton verify];
}
@end
