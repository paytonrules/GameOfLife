//
//  CellButton.h
//  GameOfLife
//
//  Created by Eric Smith on 12/28/08.
//  Copyright 2008 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CellButton : UIButton {
	int	row;
	int	column;
}

@property int row;
@property int column;

@end
