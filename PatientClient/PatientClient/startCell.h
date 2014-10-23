//
//  startCell.h
//  PatientClient
//
//  Created by dlz225 on 14-10-22.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface startCell : UITableViewCell

@property (nonatomic,strong) UILabel *doctorName;
@property (nonatomic,strong) UILabel *subject;
@property (nonatomic,strong) UIImageView *statesView;
@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,strong) UITableView *myTableView;
@end
