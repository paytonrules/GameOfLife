#import "GTMSenTestCase.h"
#import "Board.h"

@interface BoardTest : SenTestCase {	
}

@end

@implementation BoardTest

-(void)testShouldExist {
	Board* board = [[Board alloc] init];
	STAssertNotNil(board, nil);
}

@end
