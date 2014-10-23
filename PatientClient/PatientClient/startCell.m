//
//  startCell.m
//  PatientClient
//
//  Created by dlz225 on 14-10-22.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "startCell.h"

@implementation startCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCell];
    }
    return self;
}

- (void)initCell
{
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
    [label1 setFont:[UIFont systemFontOfSize:18]];
    [self.contentView addSubview:label1];
    self.doctorName = label1;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 110, 30)];
    [label2 setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:label2];
    self.subject = label2;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(220, 2, 80, 40)];
    [self.contentView addSubview:imgView];
    self.statesView = imgView;
}

- (void)awakeFromNib {
    // Initialization code
}


- (void)setIndexPath:(NSIndexPath *)indexPath
{
    UIImageView *background = [[UIImageView alloc] init];
    
    // 设置cell背景为圆角
    background.image = [[UIImage imageNamed:@"common_card_background@2x.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
    self.backgroundView = background;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
