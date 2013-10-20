//
//  TBViewController.m
//  TBDelegateProxy
//
//  Created by Mark Adams on 10/19/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBViewController.h"
#import "TBTableView.h"

static NSString *const ReuseIdentifier = @"CellReuseIdentifier";

@interface TBViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) TBTableView *tableView;

@end

@implementation TBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[TBTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%i", indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 10 == 0) {
        cell.backgroundColor = [UIColor orangeColor];
    }
}

@end
