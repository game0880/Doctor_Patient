//
//  NSString+duan.h
//  PatientClient
//
//  Created by dlz225 on 14-10-23.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (duan)

// 得到文字的size
+ (CGSize)getSizeFromText:(NSString *)title ForFont:(UIFont *)font MaxSize:(CGSize)size;

@end
