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

- (void)setUserData:(NSDictionary *)dictionary
{
    self.userName = @"0001";
    self.userRealName = @"张三";
    self.age = 22;
    self.sex = @"男";
    self.birthPlace = @"湖南省长沙市";
    self.userAddress = @"中南大学铁道学院";
    self.photoPath = @"ditu_ic.png";
    self.userTel = @"888232421";
    self.userEmail = @"hhaha@qq.com";
    
}
@end
