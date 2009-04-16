#import <UIKit/UIKit.h>
#import "GOLBoard.h"
#import "BoardProtocol.h"
#import "GameProtocol.h"

@interface Game : NSObject <GameProtocol> {
	id<BoardProtocol> myBoard;
}

-(id<BoardProtocol>) board;
-(void)setBoard:(id<BoardProtocol>) board;
-(void)advanceGeneration;

@end
