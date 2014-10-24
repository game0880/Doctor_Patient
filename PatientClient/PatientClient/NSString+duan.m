//
//  NSString+duan.m
//  PatientClient
//
//  Created by dlz225 on 14-10-23.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "NSString+duan.h"

@implementation NSString (duan)

+ (CGSize)getSizeFromText:(NSString *)title ForFont:(UIFont *)font MaxSize:(CGSize)size
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];       // 获取该段attributedString的属性字典
    
    CGSize textSize = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dictionary context:nil].size;
    return textSize;
}

@end
