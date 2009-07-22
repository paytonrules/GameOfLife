#import <SenTestingKit/SenTestingKit.h>
#import "GameRunner.h"
#import "MockGame.h"
#import "Game.h"

@interface GameRunnerTest : SenTestCase {
	Game*				game;
	GameRunner*	runner;
}

@end


@implementation GameRunnerTest

-(void) setUp {
	game = [[Game alloc] init];
	runner = [[GameRunner alloc] initWithGame: game];
}

-(void) tearDown {
	[runner release];
	[game release];
}

-(void) testEmptyIntializer {
	[runner release];
	
	runner = [[GameRunner alloc] init];
	
	STAssertNil(runner.game, nil);
	STAssertEquals(0.25, runner.interval, nil);
}

-(void) testAcceptsGameObject {
	STAssertEqualObjects(game, runner.game, nil);
}

-(void) testSetsAndGetsTimeInterval {
	runner.interval = 0.30;
	
	STAssertEquals(0.30, runner.interval, nil);
}

-(void) testCreatesNSTimerObject {
	[runner start];
	
	STAssertNotNil(runner.timer, @"The timer was not created");
	STAssertTrue([runner.timer isValid], nil);
}

-(void) testNSTimerFields {
	runner.interval = (NSTimeInterval) 0.26;
	
	[runner start];
	
	STAssertEquals([runner.timer timeInterval], 0.26, nil);	
}

-(void) testTimerCallsGameAdvance {
	MockGame *mockGame = [[MockGame alloc] init];
	runner.game = mockGame;

	[runner start];	
	[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow: 0.30]];
	
	STAssertTrue([mockGame advanceGenerationCalled], nil);
}

-(void) testStopInvalidatesTheTimer {		
	[runner start];
	
	STAssertTrue([runner.timer isValid], nil);
	
	[runner stop];
	
	STAssertFalse([runner.timer isValid], nil);
}

-(void) testStopDoesntCrashWhenTheresNoTimer {
	STAssertNoThrow([runner stop], @"Exception thrown because no timer.");
}


@end
