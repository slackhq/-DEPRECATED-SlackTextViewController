//
//  UIApplication+ExtensionSafe.h
//  SlackTextViewController
//
//  Created by Oskar Groth on 2018-05-22.
//  Copyright © 2018 Slack Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (ExtensionSafe)

+(UIApplication *)safeSharedApplication;

@end
