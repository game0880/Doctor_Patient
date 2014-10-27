//
//  ChatCell.m
//  PatientClient
//
//  Created by dlz225 on 14-10-23.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "ChatCell.h"
#import "NSString+duan.h"

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initChatCell];
    }
    
    return self;
}

- (void)initChatCell
{
    UILabel *label1 = [[UILabel alloc] init];
    [label1 setNumberOfLines:0];
    [label1 setFont:[UIFont systemFontOfSize:15]];
    self.userLabel = label1;
    [self.contentView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    [label2 setNumberOfLines:0];
    self.contentLabel = label2;
    [self.contentView addSubview:label2];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = _dataArray[indexPath.row];
    self.userLabel.text = dict[@"user"];
    self.contentLabel.text = dict[@"content"];
    CGSize s = [NSString getSizeFromText:self.contentLabel.text ForFont:[UIFont systemFontOfSize:15] MaxSize:CGSizeMake(180, MAXFLOAT)];
    
    if (s.height <= 44) {
        self.contentLabel.frame = CGRectMake(90, 0, 200, 44);
        self.userLabel.frame = CGRectMake(10,0, 80, 44);
    }
    else
    {
        self.contentLabel.frame = CGRectMake(90, 0, 200, s.height + 10);
        self.userLabel.frame = CGRectMake(10,0, 80, s.height + 10);
    }
    
    //设置cell背景
    UIImageView *background = [[UIImageView alloc] init];
    // 设置cell背景为圆角
    background.image = [[UIImage imageNamed:@"common_card_background@2x.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    self.backgroundView = background;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
