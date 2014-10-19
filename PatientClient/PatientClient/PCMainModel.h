//
//  PCMainModel.h
//  PatientClient
//
//  Created by dlz225 on 14-10-18.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PCMainModel : UINavigationController

@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIViewController *control;

@end
