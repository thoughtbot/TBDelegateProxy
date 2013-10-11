//
//  TBDelegateProxy.m
//  TBDelegateProxy
//
//  Created by Mark Adams on 10/11/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBDelegateProxy.h"

@implementation TBDelegateProxy

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.interceptorDelegate respondsToSelector:aSelector])
        return self.interceptorDelegate;

    if ([self.originalDelegate respondsToSelector:aSelector])
        return self.originalDelegate;

    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self.interceptorDelegate respondsToSelector:aSelector])
        return YES;

    if ([self.originalDelegate respondsToSelector:aSelector])
        return YES;

    return [super respondsToSelector:aSelector];
}

@end
