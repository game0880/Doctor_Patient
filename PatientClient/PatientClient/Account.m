//
//  Account.m
//  新浪微博
//
//  Created by dlz225 on 14-10-12.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "Account.h"

@implementation Account

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_accountName forKey:@"accountName"];
    [aCoder encodeObject:_password forKey:@"password"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.accountName = [aDecoder decodeObjectForKey:@"accountName"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
    }
    return self;
}

@end
