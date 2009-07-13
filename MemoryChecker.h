#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MemoryChecker : NSObject {
	Method originalAllocMethod;
	Method newAllocMethod;
	Method originalDeallocMethod;
	Method newDeallocMethod;
	NSMutableDictionary *objectsAllocated;
}

+(void) start;
+(void) stop;
+(bool) hasLeaks;
-(void) resetImplementations;
-(void) bumpAllocCount: (id) object;
-(void) decreaseAllocCount: (id) object;
-(bool) isLeak;
-(void) reset;
-(void) cleanupAutoReleasePool;

#define MEMORY_CHECKER_STOP [MemoryChecker stop];	if([MemoryChecker hasLeaks]) { STFail(@"Memory Leak detected in test"); }

@end
