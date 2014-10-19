//
//  DCAPIClient.h
//  DoctorClient
//
//  Created by JiangTeng on 14/10/19.
//  Copyright (c) 2014年 com.usc. All rights reserved.
//

#import "AFHTTPClient.h"

@interface DCAPIClient : AFHTTPClient


+ (instancetype)sharedAPIClient;

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
