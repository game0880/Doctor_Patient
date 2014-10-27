//
//  User.h
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,copy) NSString *patientId;  //id
@property (nonatomic,copy) NSString *patientName;  //用户真实姓名
@property (nonatomic,assign) NSInteger patientAge;     //年龄
@property (nonatomic,copy) NSString *patientSex;       // 性别
@property (nonatomic,copy) NSString *patientAddress;   //住址
@property (nonatomic,copy) NSString *patientPhoto;  //用户头像
@property (nonatomic,copy) NSString *patientTel; //电话
@property (nonatomic,copy) NSString *patientEmail;    //邮箱
@property (nonatomic,copy) NSString *patientBirth;     //出生
@property (nonatomic,copy) NSString *userId;    //token

+ (instancetype)shareUser;

@end
