#import "GTMSenTestCase.h"
#import "MemoryChecker.h"

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
	
	[NSObject alloc];
	
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

-(void) testNoFailureWhenAllocAndReleased
{
	[MemoryChecker start];
	
	NSString *string = [NSString alloc];
	[string release];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

-(void) testFailureWhenAllocRetainAndOneRelease
{
	[MemoryChecker start];

	NSObject *object = [NSObject alloc];
	[object retain];
	[object release];
	
	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
}

-(void) testNoFailureWhenAllocRetainReleasedReleased
{
	[MemoryChecker start];
	
	NSObject *object = [NSObject alloc];
	[object retain];
	[object release];
	[object release];
	
	STAssertNoThrow([MemoryChecker stop], nil);
}

//-(void) testShouldNotBeConfusedByManyObjects
//{
//	[MemoryChecker start];
//	
//	NSObject *object1 = [NSObject alloc];
//	[object1 release];
//	
//	NSObject *object2 = [NSObject alloc];
//	[MemoryChecker stop];
//	STAssertNotEqualObjects(object1, object2, nil);
////	STAssertThrowsSpecificNamed([MemoryChecker stop], NSException, @"SenTestFailureException", nil);
//}
	
@end
