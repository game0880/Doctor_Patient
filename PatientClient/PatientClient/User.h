//
//  User.h
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,copy) NSString *userName;  //用户名
@property (nonatomic,copy) NSString *userRealName;  //用户真实姓名
@property (nonatomic,assign) NSInteger age;     //年龄
@property (nonatomic,copy) NSString *sex;       // 性别
@property (nonatomic,copy) NSString *birthPlace;    // 籍贯
@property (nonatomic,copy) NSString *userAddress;   //住址
@property (nonatomic,copy) NSString *photoPath;  //用户头像
@property (nonatomic,copy) NSString *userTel; //电话
@property (nonatomic,copy) NSString *userEmail;    //邮箱
+ (instancetype)shareUser;

- (void)setUserData;
@end
