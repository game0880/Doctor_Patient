//
//  AccountTool.h
//  新浪微博
//
//  Created by dlz225 on 14-10-12.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "Singleton.h"

@interface AccountTool : NSObject

single_interface(AccountTool)

@property (nonatomic,readonly) Account *account;

- (void)saveAccount:(Account *)account;

@end
