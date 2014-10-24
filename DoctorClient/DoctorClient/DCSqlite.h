//
//  DCSqlite.h
//  DoctorClient
//
//  Created by JiangTeng on 14/10/20.
//  Copyright (c) 2014年 com.usc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DCSqlite : NSObject
@property (nonatomic, assign) sqlite3 *db;


+ (instancetype) shareDCSqlite;

- (void)execute:(NSString *)sql
         action:(NSString *)action
        success:(void(^)(BOOL success,NSString *error)) block;
@end
