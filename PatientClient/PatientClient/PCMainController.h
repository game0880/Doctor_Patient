//
//  PCMainController.h
//  PatientClient
//
//  Created by dlz225 on 14-10-18.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "DrawerViewController.h"

@interface PCMainController : DrawerViewController


@property (nonatomic,strong) NSMutableArray *controlArray;

+ (instancetype)shareMainViewController;

@end
