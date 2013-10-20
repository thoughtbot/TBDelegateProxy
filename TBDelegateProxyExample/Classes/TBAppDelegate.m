//
//  TBAppDelegate.m
//  TBDelegateProxy
//
//  Created by Mark Adams on 10/11/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBAppDelegate.h"
#import "TBViewController.h"

@implementation TBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[TBViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
