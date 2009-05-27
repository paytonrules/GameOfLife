#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MemoryChecker : NSObject {
	Method originalAllocMethod;
	Method newAllocMethod;
	Method originalReleaseMethod;
	Method newReleaseMethod;
	Method originalRetainMethod;
	Method newRetainMethod;
	NSMutableDictionary *objectsAllocated;
}

+(void) start;
+(void) stop;
-(void) resetImplementations;
-(void) bumpAllocCount: (id) object;
-(void) decreaseAllocCount: (id) object;
-(bool) isLeak;

@end
