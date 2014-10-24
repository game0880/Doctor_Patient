//
//  DCSqlite.m
//  DoctorClient
//
//  Created by JiangTeng on 14/10/20.
//  Copyright (c) 2014年 com.usc. All rights reserved.
//

#import "DCSqlite.h"

@implementation DCSqlite

+ (instancetype)shareDCSqlite{
    static DCSqlite *dcsqlite = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dcsqlite = [[DCSqlite alloc] init];
    });
    
    return dcsqlite;
}


- (id)init{
    self = [super init];
    if (self) {
        [self openDataBease];
    }
    
    return self;
}

- (void)openDataBease{
    NSString *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [doc stringByAppendingPathComponent:@"DCDatabease.sqlite"];
    

    int result = sqlite3_open(path.UTF8String, &_db);
    
    if (result == SQLITE_OK) {
        LogDebug(@"成功打开数据库");
    } else {
        LogDebug(@"打开数据库失败");
    }

}


- (void)execute:(NSString *)sql
         action:(NSString *)action
        success:(void(^)(BOOL success,NSString *error)) block
{
    const char *sqlStr = sql.UTF8String;
    
    char *error = NULL;
    // 执行sql语句
    int result = sqlite3_exec(_db, sqlStr, NULL, NULL, &error);
    
    if (result == SQLITE_OK) {
        NSString *successStr = [NSString stringWithFormat:@"成功%@",action];
        LogDebug(@"%@", successStr);
        block(YES,successStr);
    } else {
        NSString *failureStr = [NSString stringWithFormat:@"失败%@",action];
        LogDebug(@"%@",failureStr);
        block(NO,failureStr);
    }
}




@end
