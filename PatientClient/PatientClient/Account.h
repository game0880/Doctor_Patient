//
//  Account.h
//  新浪微博
//
//  Created by dlz225 on 14-10-12.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic,copy) NSString *accountName;
@property (nonatomic,copy) NSString *password;

@end
