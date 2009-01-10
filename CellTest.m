#import "GTMSenTestCase.h"
#import "Cell.h"

@interface CellTest : SenTestCase {
	Cell	*itsCell;
}
@end

@implementation CellTest

-(void) setUp {
	itsCell = [[Cell alloc] init];
}

-(void) testExists {
	STAssertNotNil(itsCell, nil);
}

-(void) testShouldDefaultToDead {
	STAssertFalse(itsCell.alive, nil);
}

-(void) testRessurectShouldMakeCellAlive {
	[itsCell resurrect];
	
	STAssertTrue(itsCell.alive, nil);
}

-(void) testKillShouldMakeCellDead {
	[itsCell resurrect];
	[itsCell kill];
	
	STAssertFalse(itsCell.alive, nil);
}

@end
