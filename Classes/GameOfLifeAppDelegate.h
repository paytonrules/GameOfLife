//
//  GameOfLifeAppDelegate.h
//  GameOfLife
//
//  Created by Eric Meyer on 11/24/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameOfLifeViewController;

@interface GameOfLifeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GameOfLifeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GameOfLifeViewController *viewController;

@end

