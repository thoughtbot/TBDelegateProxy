//
//  TBTableView.m
//  TBDelegateProxy
//
//  Created by Mark Adams on 10/19/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBTableView.h"
#import "TBDelegateProxy.h"

@interface TBTableView () <UITableViewDelegate>

@property (strong, nonatomic) TBDelegateProxy *delegateProxy;

@end

@implementation TBTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];

    if (!self) {
        return nil;
    }

    [self commonInit];

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (!self) {
        return nil;
    }

    [self commonInit];

    return self;
}

- (void)commonInit
{
    _delegateProxy = [[TBDelegateProxy alloc] init];
    _delegateProxy.interceptorDelegate = self;
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    self.delegateProxy.originalDelegate = delegate;
    [super setDelegate:(id)self.delegateProxy];
}

- (id<UITableViewDelegate>)delegate
{
    return self.delegateProxy.originalDelegate;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIColor *backgroundColor = [UIColor whiteColor];

    if (indexPath.row % 2 != 0) {
        backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    }

    cell.backgroundColor = backgroundColor;

    if ([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

@end
