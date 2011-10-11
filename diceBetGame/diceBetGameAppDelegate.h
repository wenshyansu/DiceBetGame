//
//  diceBetGameAppDelegate.h
//  diceBetGame
//
//  Created by apple on 11-8-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class diceBetGameViewController;

@interface diceBetGameAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet diceBetGameViewController *viewController;

@end
