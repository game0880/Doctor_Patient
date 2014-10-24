//
//  UserCell.m
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 44)];
    label.numberOfLines = 0;
    self.title = label;
    [self.contentView addSubview:label];
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(110, 0, [UIScreen mainScreen].bounds.size.width - 100, 44)];
    self.content = field;
    [self.contentView addSubview:field];
    
    }

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
