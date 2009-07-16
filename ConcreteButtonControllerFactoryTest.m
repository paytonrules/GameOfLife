#import "GTMSenTestCase.h"
#import "ConcreteButtonControllerFactory.h"
#import "Cell.h"
#import "MemoryChecker.h"

@interface ConcreteButtonControllerFactoryTest : SenTestCase {
	ConcreteButtonControllerFactory *itsFactory;
	ButtonController				*itsController;
	CGPoint									itsPoint;
	CGRect									itsRect;
	Cell										*itsCell;
}

@end

@implementation ConcreteButtonControllerFactoryTest

-(void) setUp 
{
//	[MemoryChecker start];
	itsFactory = [[ConcreteButtonControllerFactory alloc] init];
	itsPoint = CGPointMake(1.0f, 2.0f);
	itsRect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
	itsCell = [[Cell alloc] init];
	itsController = [itsFactory createButtonControllerForCell:itsCell at:itsPoint sizeOf: itsRect];
}

-(void) tearDown 
{
	[itsFactory release];
	[itsController release];
	[itsCell release];
//	MEMORY_CHECKER_STOP;
}

-(void)testCanBeCreated 
{
	STAssertNotNil(itsFactory, nil);
}

-(void)testCreatesButtonController 
{
	STAssertNotNil(itsController, nil);
}

-(void)testAssignsItsView 
{
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertEquals(button.frame.size.width, 20.0f,nil);
	STAssertEquals(button.frame.size.height, 20.0f,nil);
	STAssertEquals(button.center.x, 1.0f, nil);
	STAssertEquals(button.center.y, 2.0f, nil);
}

-(void)testAssignsActionToView 
{
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertTrue([[button actionsForTarget: itsController forControlEvent: UIControlEventTouchUpInside] containsObject:@"bringToLife:"], nil);
}

-(void)testViewSetToDead
{
	UIButton *button = (UIButton *)itsController.view;
	
	STAssertEqualObjects([UIImage imageNamed:@"dead_cell.png"], [button imageForState:UIControlStateNormal], nil);
}
@end
