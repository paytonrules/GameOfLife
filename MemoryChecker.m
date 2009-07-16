#import "MemoryChecker.h"
#import "GTMSenTestCase.h"

static MemoryChecker *checker = nil;

@implementation NSObject ( MemoryChecking )

+ (id)myAllocWithZone:(NSZone *)zone
{
	id object = [[self class] myAllocWithZone:zone];
	[checker bumpAllocCount: object];
	return object;
}

- (void)myDealloc
{
	[checker decreaseAllocCount: self];
	
	return [self myDealloc];
}

@end

@implementation MemoryChecker

+(void) start
{
	if (checker == nil)
	{
		checker = [[MemoryChecker alloc] init];
	}
	
	[checker reset];
}

+(void) stop
{
	[checker cleanupAutoReleasePool];
	[checker resetImplementations];
}

+(bool) hasLeaks
{
	return [checker isLeak];
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

// Duplication duplication - ick.	
-(void) exchangeAllocMethods
{
	originalAllocMethod = class_getClassMethod([NSObject class], @selector(allocWithZone:));	
	newAllocMethod = class_getClassMethod([NSObject class], @selector(myAllocWithZone:));
		
	method_exchangeImplementations(originalAllocMethod, newAllocMethod);
}

-(void) exchangeDeallocMethods
{
	originalDeallocMethod = class_getInstanceMethod([NSObject class], @selector(dealloc));		
	newDeallocMethod = class_getInstanceMethod([NSObject class], @selector(myDealloc));
	
	method_exchangeImplementations(originalDeallocMethod, newDeallocMethod);	
}

-(void) reset 
{
	if(objectsAllocated != nil)
	{
		objectsAllocated = nil;
	}
	
	objectsAllocated = [NSMutableDictionary dictionaryWithCapacity:5];
	
	[self exchangeAllocMethods];
	[self exchangeDeallocMethods];
	pool = [[NSAutoreleasePool alloc] init];
}

-(void) cleanupAutoReleasePool
{
	[pool release];
	pool = nil;
}

-(void) bumpAllocCount: (id) object
{
	NSString *location = [[NSString alloc] initWithFormat: @"%ld", object];
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey: location] integerValue];
		
	numAllocsForObject++;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: location];
}

-(void) decreaseAllocCount: (id) object
{
	NSString *location = [[NSString alloc] initWithFormat: @"%ld", object];
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey:location] integerValue];
	
	numAllocsForObject--;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: location];
}

-(void) resetImplementations
{
	method_exchangeImplementations(originalAllocMethod, newAllocMethod);
	method_exchangeImplementations(originalDeallocMethod, newDeallocMethod);
}

@end
