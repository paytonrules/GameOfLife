#import "GTMSenTestCase.h"
#import "MemoryChecker.h"
#import "ButtonController.h"
#import "Cell.h"

@interface MemoryCheckerTest : SenTestCase {
}
@end


@implementation MemoryCheckerTest

-(void) testNoFailureWhenNoMemoryAllocation
{
	[MemoryChecker start];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

-(void) testFailureWhenAllocWithoutRelease
{
	[MemoryChecker start];
	
	[[NSObject alloc] init];
		
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

-(void) testNoFailureWhenAllocAndReleased
{
	[MemoryChecker start];
	
	NSObject *object = [[NSObject alloc] init];
	[object release];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

-(void) testFailureWhenAllocRetainAndOneRelease
{
	[MemoryChecker start];

	NSObject *object = [[NSObject alloc] init];
	[object retain];
	[object release];
	
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

-(void) testNoFailureWhenAllocRetainReleasedReleased
{
	[MemoryChecker start];
	
	NSObject *object = [[NSObject alloc] init];
	[object retain];
	[object release];
	[object release];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

-(void) testShouldWorkWithObjectsOtherThanNSObject
{
	[MemoryChecker start];
	
	[[MemoryCheckerTest alloc] init];
	
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

-(void) testShouldWorkWithObjectsOtherThanNSObjectNoLeak
{
	[MemoryChecker start];
	
	MemoryCheckerTest *test = [[MemoryCheckerTest alloc] init];
	[test release];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

-(void) testErrorsWithObservers
{
	[MemoryChecker start];
	
	NSObject *myObjectToObserve = [[NSObject alloc] init];
	[myObjectToObserve addObserver:self forKeyPath:@"alive" options:NSKeyValueObservingOptionNew context:NULL];
	
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

//-(void) testShouldCatchMemoryLeaksOnCopy
//{
//	[MemoryChecker start];
//	
//	MemoryCheckerTest *test1 = [[MemoryCheckerTest alloc] init];
//	MemoryCheckerTest *test2 = [test1 copy];
//	[test1 release];
//
//	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
//}

//-(void) testShouldNotBeConfusedByManyObjects
//{
//	[MemoryChecker start];
//	
//	NSObject *object1 = [NSObject alloc];
//	[object1 release];
//	
//	NSObject *object2 = [NSObject alloc];
//	[MemoryChecker stop];
//	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
//}
	
@end
