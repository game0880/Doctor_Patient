//
//  PCAPIClient.h
//  PatientClient
//
//  Created by JiangTeng on 14/10/24.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface PCAPIClient : AFHTTPClient
+ (instancetype)sharedAPIClient;

- (void)setAccessToken:(NSString*)token;

// User Auth
+ (void)userAuth:(NSString*)path
      parameters:(NSDictionary*)params
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

// Get api
- (AFHTTPRequestOperation *)getPath:(NSString *)path
                         parameters:(NSDictionary *)parameters
                            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


//post Api
- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(AFHTTPRequestOperation *, id))success
         failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure;

@end
