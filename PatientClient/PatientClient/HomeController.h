//
//  HomeController.h
//  PatientClient
//
//  Created by dlz225 on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawerViewController.h"

@interface HomeController :DrawerViewController

@property (nonatomic, strong) UIButton *leftItem;

@property (nonatomic,strong) UIButton *startButton;
@property (nonatomic,strong) UIButton *resumeButton;
@property (nonatomic,strong) UIScrollView *scrollView;

@end
