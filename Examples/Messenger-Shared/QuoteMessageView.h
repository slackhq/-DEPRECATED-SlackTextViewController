//
//  QuoteMessageView.h
//  Messenger
//
//  Created by Kobi Meirson on 7/22/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLKCustomBarProtocol.h"

@interface QuoteMessageView : UIView <SLKCustomBarProtocol>

- (void)quote:(NSString*)title withText:(NSString*)body;

@end
