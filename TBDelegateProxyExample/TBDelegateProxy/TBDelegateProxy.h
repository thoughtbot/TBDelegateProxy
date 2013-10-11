//
//  TBDelegateProxy.h
//  TBDelegateProxy
//
//  Created by Mark Adams on 10/11/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

@interface TBDelegateProxy : NSObject

@property (strong, nonatomic) id originalDelegate;
@property (strong, nonatomic) id interceptorDelegate;

@end
