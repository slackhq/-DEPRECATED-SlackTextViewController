//
//  AppDelegate.m
//  Messenger-Child-View-Controller
//
//  Created by Ignacio Romero Z. on 3/24/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "MessageViewController.h"
#import "ChildViewController.h"

#import "MessageTextView.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ChildViewController *childVC = [[ChildViewController alloc] initWithStyle:UITableViewStylePlain];

    MessageViewController *messageVC = [[MessageViewController alloc] initWithChildViewController:childVC];
    messageVC.inverted = YES;
    [messageVC registerClassForTextView:[MessageTextView class]];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:messageVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
