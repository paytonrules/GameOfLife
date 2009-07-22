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
	itsController = [[ButtonController alloc] initWithCell: itsCell];
	itsButton = [OCMockObject niceMockForClass:[UIButton class]];

	itsController.view =	(UIButton *)itsButton;
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

-(void) testObservingValueOfCellAlive
{
	[[itsButton expect] addTarget: itsController action:@selector(bringToLife:) forControlEvents: UIControlEventTouchUpInside];
	[itsCell setAlive: false];
	[itsButton verify];
	
	[[itsButton expect] addTarget: itsController action:@selector(kill:) forControlEvents: UIControlEventTouchUpInside];	
	[itsCell setAlive: true];
	[itsButton verify];
}

-(void) testKillLoadsTheDeadCell
{
	OCMockObject *mockImageFactory = [OCMockObject mockForProtocol:@protocol(ImageFactory)];
	itsController.imageFactory =(NSObject *)mockImageFactory;
	
	[[mockImageFactory expect] createFromName:@"dead_cell.png"];
	
	[itsController kill: nil];
	
	[mockImageFactory verify];
}

-(void) testKillChangesTheButtonBackgroundImageToTheDeadCell
{
	id mockImage = [OCMockObject niceMockForClass:[UIButton class]];
	OCMockObject *mockImageFactory = [OCMockObject mockForProtocol:@protocol(ImageFactory)];
	[[[mockImageFactory stub] andReturn:mockImage] createFromName:@"dead_cell.png"];
	itsController.imageFactory =(NSObject *)mockImageFactory;

	[[itsButton expect] setImage:mockImage forState:UIControlStateNormal];
	
	[itsController kill: nil];

	[itsButton verify];
}

-(void) testBringToLifeChangesButtonsBackgroundImage
{
	id mockImage = [OCMockObject niceMockForClass:[UIButton class]];
	OCMockObject *mockImageFactory = [OCMockObject mockForProtocol:@protocol(ImageFactory)];
	[[[mockImageFactory stub] andReturn:mockImage] createFromName:@"alive_cell.png"];
	itsController.imageFactory =(NSObject *)mockImageFactory;
	
	[[itsButton expect] setImage:mockImage forState:UIControlStateNormal];
	
	[itsController bringToLife: nil];
	
	[itsButton verify];
}

@end
