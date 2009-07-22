#import <SenTestingKit/SenTestingKit.h>
#import "GameOfLifeViewController.h"
#import "MockButtonControllerFactory.h"
#import "MockBoard.h"
#import "MockGame.h"
#import "MockGameRunner.h"
#import "MemoryChecker.h"

@interface GameOfLifeViewControllerTest : SenTestCase {
	GameOfLifeViewController *itsController;
	MockButtonControllerFactory *itsFactory;
	MockBoard *itsBoard;
	MockGame *itsGame;
	MockGameRunner *itsGameRunner;
}
@end


@implementation GameOfLifeViewControllerTest

-(void)setUp 
{
	itsController = [[GameOfLifeViewController alloc] init];
	itsFactory = [[MockButtonControllerFactory alloc] init];
	itsBoard = [[MockBoard alloc] init];
	itsGame = [[MockGame alloc] init];
	itsGameRunner = [[MockGameRunner alloc] init];
	
	itsController.buttonFactory = itsFactory;
	itsController.board = itsBoard;
	itsController.game = itsGame;
	itsController.gameRunner = itsGameRunner;
	[itsController loadView];
}

-(void) tearDown 
{
	[itsFactory release];
	[itsBoard release];
	[itsController release];
	[itsGame release];
}

-(void) testHasAllButtons 
{
	NSArray *subviews = [itsController.view subviews];
	
	int count = [subviews count];
	
	STAssertEquals(count, [itsBoard rows] * [itsBoard columns], nil);
}

-(void) testCreatesAllButtonControllers 
{	
	// Mock board should have 1 one button]
	// Duplication - me no like
	// Figured it out - this should be a seperate class
	CGPoint point = CGPointMake([GameOfLifeViewController calculatePositionFor: 0], [GameOfLifeViewController calculatePositionFor: 0]);
	CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);

	Cell *cell = [itsController.board getCellAt:0 by:0];
	bool called = [itsFactory calledWith:cell at:point sizeOf:rect];
	STAssertTrue(called, nil);
}

-(void) testStartActionTurnsButtonToStop
{
	UIButton *button = [[UIButton alloc] init];
	[button setTitle:@"Start" forState:UIControlStateNormal];
	
	[itsController start:button];
	
	STAssertEquals(@"Stop", [button titleForState: UIControlStateNormal], nil);
}

-(void) testStartActionChangesButtonActionToStop
{
	UIButton *button = [[UIButton alloc] init];
	[button addTarget:nil action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
	
	[itsController start:button];
	
	STAssertTrue([[button actionsForTarget:nil forControlEvent:UIControlEventTouchUpInside] containsObject:@"stop:"], nil);
	STAssertFalse([[button actionsForTarget:nil forControlEvent: UIControlEventTouchUpInside] containsObject:@"start:"], nil);
}

-(void) testStopActionTurnsButtonToStart
{
	UIButton *button = [[UIButton alloc] init];
	[button setTitle:@"Stop" forState:UIControlStateNormal];
	
	[itsController stop: button];
	
	STAssertEquals(@"Start", [button titleForState:UIControlStateNormal], nil);
}

-(void) testStopActionChangesButtonActionToStart
{
	UIButton *button = [[UIButton alloc] init];
	[button addTarget:nil action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
	
	[itsController stop: button];

	STAssertTrue([[button actionsForTarget:nil forControlEvent:UIControlEventTouchUpInside] containsObject:@"start:"], nil);
	STAssertFalse([[button actionsForTarget: nil forControlEvent: UIControlEventTouchUpInside] containsObject:@"stop:"], nil);
}

-(void) testStartActionStartsGame
{
	[itsController start: nil];
	
	STAssertTrue([itsGameRunner isStartCalled], nil);
}

-(void) testStopsActionStopsGame
{
	[itsController stop: nil];
	
	STAssertTrue([itsGameRunner isStopCalled], nil);
}

-(void) testAdvanceOneGeneration
{
	[itsController advance:nil];
	
	STAssertTrue([itsGame advanceGenerationCalled], nil);
}
	

@end
