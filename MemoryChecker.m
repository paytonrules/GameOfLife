#import "MemoryChecker.h"
#import "GTMSenTestCase.h"

static MemoryChecker *checker = nil;

@implementation NSObject ( MemoryChecking )

+ (id)myAllocWithZone:(NSZone *)zone 
{
	id object = [NSObject myAllocWithZone:zone];
	[checker bumpAllocCount: object];
	return object;
}

- (void)myRelease
{
	[checker decreaseAllocCount: self];
	
	return [self myRelease];
}

// I just realized I'm reimplementing ref counting.  Should I?
-(id)myRetain
{
	[checker bumpAllocCount:self];
	
	return [self myRetain];
}

@end

@implementation MemoryChecker

+(void) start
{
	checker = [[MemoryChecker alloc] init];
}

+(void) stop
{
	bool isLeak = [checker isLeak];
	[checker resetImplementations];
	[checker release];
	checker = nil;
	
	if(isLeak)
	{
		STFail(@"Memory Leak detected in test: testFailureWhenAllocWithoutRelease");
	}
}

-(bool) isLeak
{
	for (id number in [objectsAllocated allValues])
	{
		if ([number integerValue] != 0)
			return true;
	}
	
	return false;
}

-(void) exchangeAllocMethods
{
	originalAllocMethod = class_getClassMethod([NSObject class], @selector(allocWithZone:));	
	newAllocMethod = class_getClassMethod([NSObject class], @selector(myAllocWithZone:));
		
	method_exchangeImplementations(originalAllocMethod, newAllocMethod);
}

-(void) exchangeReleaseMethods
{
	originalReleaseMethod = class_getInstanceMethod([NSObject class], @selector(release));		
	newReleaseMethod = class_getInstanceMethod([NSObject class], @selector(myRelease));
	
	method_exchangeImplementations(originalReleaseMethod, newReleaseMethod);	
}

-(void) exchangeRetainMethods
{
	originalRetainMethod = class_getInstanceMethod([NSObject class], @selector(retain));		
	newRetainMethod = class_getInstanceMethod([NSObject class], @selector(myRetain));
	
	method_exchangeImplementations(originalRetainMethod, newRetainMethod);	
}

-(id) init 
{
	if (self = [super init])
	{
		objectsAllocated = [NSMutableDictionary dictionaryWithCapacity:5];
		[self exchangeAllocMethods];
		[self exchangeReleaseMethods];
		[self exchangeRetainMethods];
	}
		
		return self;
}

-(void) bumpAllocCount: (id) object
{
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey: [object description]] integerValue];
		
	numAllocsForObject++;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: [object description]];
}

-(void) decreaseAllocCount: (id) object
{
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey: [object description]] integerValue];
	
	numAllocsForObject--;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: [object description]];
}

-(void) resetImplementations
{
	method_exchangeImplementations(originalAllocMethod, newAllocMethod);
	method_exchangeImplementations(originalReleaseMethod, newReleaseMethod);
	method_exchangeImplementations(originalRetainMethod, newRetainMethod);
}

@end
