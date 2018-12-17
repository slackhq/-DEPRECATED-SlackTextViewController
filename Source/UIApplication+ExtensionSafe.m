//
//  UIApplication+ExtensionSafe.m
//  SlackTextViewController
//
//  Created by Oskar Groth on 2018-05-22.
//  Copyright © 2018 Slack Technologies, Inc. All rights reserved.
//

#import "UIApplication+ExtensionSafe.h"

@implementation UIApplication (ExtensionSafe)

+ (BOOL)isAppExtension
{
        return [[self class] safeSharedApplication] == nil;
}

+ (UIApplication *)safeSharedApplication
{
        UIApplication *safeSharedApplication = nil;

        if ([UIApplication respondsToSelector:@selector(sharedApplication)]) {
            safeSharedApplication = [UIApplication performSelector:@selector(sharedApplication)];
        }
        if (!safeSharedApplication.delegate) {
            safeSharedApplication = nil;
        }

        return safeSharedApplication;
}

@end
