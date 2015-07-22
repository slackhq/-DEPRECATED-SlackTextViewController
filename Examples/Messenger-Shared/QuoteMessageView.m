//
//  QuoteMessageView.m
//  Messenger
//
//  Created by Kobi Meirson on 7/22/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import "QuoteMessageView.h"
#import "MessageTableViewCell.h"

@interface QuoteMessageView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bodyLabel;
@property (nonatomic, strong) UIButton *dismissButton;
@end

@implementation QuoteMessageView
@synthesize visible = _visible;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.bodyLabel];
    [self addSubview:self.dismissButton];
    
    self.backgroundColor = [UIColor colorWithRed:0.965 green:0.965 blue:0.965 alpha:1];
    
    NSDictionary *views = @{
                            @"titleLabel": self.titleLabel,
                            @"bodyLabel": self.bodyLabel,
                            @"dismissButton": self.dismissButton
                            };
    
    NSDictionary *metrics = @{@"padding": @15,
                              @"right": @10,
                              @"top": @5
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[titleLabel]-(>=5)-[dismissButton(>=40)]-(right@751)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[bodyLabel]-(>=5)-[dismissButton(>=40)]-(right@751)-|" options:0 metrics:metrics views:views]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.dismissButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[titleLabel]-top-[bodyLabel]-(top@751)-|" options:0 metrics:metrics views:views]];
}

- (void)quote:(NSString *)title withText:(NSString *)body
{
    self.titleLabel.text = title;
    self.bodyLabel.text = body;
    if (body.length > 140) {
        self.bodyLabel.text = [[body substringToIndex:139] stringByAppendingString:@"..."];
    }
    self.visible = YES;
}

#pragma mark - Getters

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.userInteractionEnabled = NO;
        _titleLabel.numberOfLines = 0;
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        _titleLabel.textColor = [UIColor grayColor];
    }
    return _titleLabel;
}

- (UILabel *)bodyLabel
{
    if (!_bodyLabel) {
        _bodyLabel = [UILabel new];
        _bodyLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _bodyLabel.backgroundColor = [UIColor clearColor];
        _bodyLabel.userInteractionEnabled = NO;
        _bodyLabel.numberOfLines = 1;
        
        _bodyLabel.font = [UIFont systemFontOfSize:16.0];
        _bodyLabel.textColor = [UIColor darkGrayColor];
    }
    return _bodyLabel;
}

- (UIButton *)dismissButton
{
    if (!_dismissButton) {
        _dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _dismissButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_dismissButton setTitle:@"Close" forState:UIControlStateNormal];
        [_dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissButton;
}

- (void)dismiss:(id)sender
{
    if (self.visible) {
        self.visible = NO;
    }
}

#pragma mark - SLKCustomBarProtocol

- (CGFloat)height
{
    return [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

@end
