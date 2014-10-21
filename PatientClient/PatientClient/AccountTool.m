//
//  AccountTool.m
//  新浪微博
//
//  Created by dlz225 on 14-10-12.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "AccountTool.h"
#define kFile [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"account.data"]

@implementation AccountTool

single_implementation(AccountTool)

- (void)saveAccount:(Account *)account
{
    _account = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
}

- (id)init
{
    if (self = [super init]) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}

@end
