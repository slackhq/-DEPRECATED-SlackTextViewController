//
//  SlackTextViewController
//  https://github.com/slackhq/SlackTextViewController
//
//  Copyright 2014-2016 Slack Technologies, Inc.
//  Licence: MIT-Licence
//

#import "SLKInputAccessoryView.h"

#import "SLKUIConstants.h"

@implementation SLKInputAccessoryView

#pragma mark - Super Overrides

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    _keyboardViewProxy = newSuperview;
}

@end