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
-(void) resetImplementations;
-(void) bumpAllocCount: (id) object;
-(void) decreaseAllocCount: (id) object;
-(bool) isLeak;

@end
