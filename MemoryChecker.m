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
		STFail(@"Memory Leak detected in test");
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

-(id) init 
{
	if (self = [super init])
	{
		objectsAllocated = [NSMutableDictionary dictionaryWithCapacity:5];
		[self exchangeAllocMethods];
		[self exchangeDeallocMethods];
	}
	
	return self;
}

-(void) bumpAllocCount: (id) object
{
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey: @"TestKey"] integerValue];
		
	numAllocsForObject++;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: @"TestKey"];
}

-(void) decreaseAllocCount: (id) object
{
	NSInteger numAllocsForObject = [[objectsAllocated valueForKey: @"TestKey"] integerValue];
	
	numAllocsForObject--;
	
	[objectsAllocated setValue: [NSNumber numberWithInt:numAllocsForObject] forKey: @"TestKey"];
}

-(void) resetImplementations
{
	method_exchangeImplementations(originalAllocMethod, newAllocMethod);
	method_exchangeImplementations(originalDeallocMethod, newDeallocMethod);
}

@end
