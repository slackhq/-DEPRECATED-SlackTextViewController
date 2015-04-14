//
//  ChildViewController.m
//  Messenger-Child-View-Controller
//
//  Created by Ignacio Romero Z. on 3/24/15.
//  Copyright (c) 2015 Slack Technologies, Inc. All rights reserved.
//

#import "ChildViewController.h"
#import "Message.h"

#import <LoremIpsum/LoremIpsum.h>

static NSString *MessengerCellIdentifier = @"MessengerCell";

@interface ChildViewController ()
@property (nonatomic, strong) NSMutableArray *messages;
@end

@implementation ChildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i++) {
        Message *message = [Message new];
        message.username = [LoremIpsum name];
        message.text = [LoremIpsum wordsWithNumber:8];
        [array addObject:message];
    }
    
    self.messages = [[NSMutableArray alloc] initWithArray:array];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self messageCellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)messageCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MessengerCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MessengerCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Message *message = self.messages[indexPath.row];

    cell.textLabel.text = message.username;
    cell.detailTextLabel.text = message.text;
    cell.detailTextLabel.numberOfLines = 0;

    // Cells must inherit the table view's transform
    // This is very important, since the main table view may be inverted
    cell.transform = self.tableView.transform;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

@end
