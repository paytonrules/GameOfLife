#import "GTMSenTestCase.h"
#import "MemoryChecker.h"
#import "ButtonController.h"
#import "Cell.h"

@interface MemoryCheckerTest : SenTestCase {
}
@end


@implementation MemoryCheckerTest

-(void) assertHasException
{
	@try
	{
		MEMORY_CHECKER_STOP;
		STFail(@"There was no error");
	}
	@catch (NSException *e) 
	{
		NSRange range = [[e reason] rangeOfString: @"Memory Leak"];
		STAssertNotEquals((NSUInteger) NSNotFound, range.location, nil);
	}
}

-(void) assertNoException
{
	@try
	{
		MEMORY_CHECKER_STOP
	}
	@catch (NSException *e) {
		STFail(@"There should not be an exception");
	}	
}

-(void) testNoFailureWhenNoMemoryAllocation
{
	[MemoryChecker start];
	
	[self assertNoException];
}

-(void)	testFailureIsAtTheStopLocation
{
	[MemoryChecker start];
	[[NSObject alloc] init];
	@try
	{
		MEMORY_CHECKER_STOP;
		STFail(@"There was no error");
	}
	@catch (NSException *e)
	{
		NSString *errorString = [NSString stringWithFormat:@"%s:%d: error: Memory Leak detected in test", __FILE__, (__LINE__ - 5)];
		STAssertEqualStrings(errorString, [e reason], nil); // Seriously hate this test, but I need to test the line and file this is on. 
	}
}

-(void) testFailureWhenAllocWithoutRelease
{
	[MemoryChecker start];
	
	NSObject *object = [[NSObject alloc] init];
	
	[self assertHasException];
	
	[object release];
}

-(void) testNoFailureWhenAllocAndReleased
{
	[MemoryChecker start];
	
	NSObject *object = [[NSObject alloc] init];
	[object release];
	
	[self assertNoException];
}

-(void) testFailureWhenAllocRetainAndOneRelease
{
	[MemoryChecker start];

	NSObject *object = [[NSObject alloc] init];
	[object retain];
	[object release];
	
	[self assertHasException];

	[object release];
}

-(void) testNoFailureWhenAllocRetainReleasedReleased
{
	[MemoryChecker start];
	
	NSObject *object = [[NSObject alloc] init];
	[object retain];
	[object release];
	[object release];
	
	[self assertNoException];
}

-(void) testShouldWorkWithObjectsOtherThanNSObject
{
	[MemoryChecker start];
	
	MemoryChecker *checker = [[MemoryCheckerTest alloc] init];
	
	[self assertHasException];
	
	[checker release];
}

-(void) testErrorsWithObservers
{
	[MemoryChecker start];
	
	NSObject *myObjectToObserve = [[NSObject alloc] init];
	[myObjectToObserve addObserver:self forKeyPath:@"alive" options:NSKeyValueObservingOptionNew context:NULL];
	
	[self assertHasException];
	
	[myObjectToObserve removeObserver:self forKeyPath: @"alive"];
	[myObjectToObserve release];
}

-(void) testShouldWorkWithObjectsOtherThanNSObjectNoLeak
{
	[MemoryChecker start];
	
	MemoryCheckerTest *test = [[MemoryCheckerTest alloc] init];
	[test release];
	
	[self assertNoException];
}

//-(void) testShouldNotRaiseOnItemsInTheAutoReleasePool
//{
//	[MemoryChecker start];
//	
//	[[[NSObject alloc] init] autorelease];
//	
//	@try
//	{
//		MEMORY_CHECKER_STOP;
//	}
//	@catch (NSException *e) 
//	{
//		STFail(@"There should be no memory leaks");
//	}
//}

//-(void) testShouldCatchMemoryLeaksOnCopy
//{
//	[MemoryChecker start];
//	
//	NSObject *test1 = [[NSObject alloc] init];
//	NSObject *test2 = [test1 copy];
//	[test1 release];
//
//	@try
//	{
//		MEMORY_CHECKER_STOP;
//		STFail(@"There was no error");
//	}
//	@catch (NSException *e) 
//	{
//		STAssertEqualStrings(@"SenTestFailureException", [e name], nil);
//	}
//	
//	[test2 release];
//}
//
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
//	
@end
