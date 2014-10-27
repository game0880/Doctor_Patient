//
//  User.m
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)shareUser
{
    static User *user;
    static dispatch_once_t onecToken;
    
    dispatch_once(&onecToken, ^{
        user = [[User alloc] init];
    });
    return user;
}

@end
