//
//  PersonCenterController.m
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "PersonCenterController.h"
#define kPropertyCount 9
#define kCellHeight 40
#define kGap 13

@interface PersonCenterController () <UIScrollViewDelegate>

@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userRealNameLabel;
@property (nonatomic,strong) UILabel *ageLabel;
@property (nonatomic,strong) UILabel *sexLabel;
@property (nonatomic,strong) UILabel *birthPlaceLabel;
@property (nonatomic,strong) UILabel *userAddressLabel;
@property (nonatomic,strong) UIImageView *photoPathImageView;  //用户头像
@property (nonatomic,strong) UILabel *userTelLabel;

@property (nonatomic,strong) UIView *firstView; //包含头像、用户名、性别、年龄
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation PersonCenterController

- (id)init
{
    if (self = [super init]) {
        // 创建基本界面
        [self initUI];
        
        self.user = [User shareUser];
        // 设置假数据
        [self.user setUserData];
        
        // 创建用户基本信息界面
        [self initUserUI];
    }
    return self;
}




- (void)initUI
{
    // 标题
    self.title = @"Person Center";
    
    // 左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"navigationbar_pop@2x.png"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    UIImage *image2 = [UIImage imageNamed:@"navigationbar_pop_highlighted@2x.png"];
    [btn setBackgroundImage:image2 forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,image.size};
//    [btn addTarget:self action:@selector(personCenterLeftButton) forControlEvents:UIControlEventTouchUpInside];
    self.leftItem = btn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Action" style:UIBarButtonItemStylePlain target:self action:@selector(personCenterRightButton)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 确定view
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(kGap, 0, [UIScreen mainScreen].bounds.size.width - 2 * kGap, 180)];
//    [v1 setBackgroundColor:[UIColor redColor]];
    self.firstView = v1;
    [self.view addSubview:v1];
    
    // 确定scrollView
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(kGap, 180, [UIScreen mainScreen].bounds.size.width - 2 * kGap, [UIScreen mainScreen].bounds.size.height - 180)];
    
    // 设置滚动size
    scroll.contentSize = CGSizeMake(0, kCellHeight * (kPropertyCount - 1) + 2 * kGap);
//    scroll.backgroundColor = [UIColor grayColor];
    scroll.delegate = self;
    [self.view addSubview:scroll];
    self.scrollView = scroll;

}

- (void)initUserUI
{
    
    // 设置头像
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.image = [UIImage imageNamed:self.user.photoPath];
    imageview.frame = CGRectMake(kGap, 90, 80, 80);
    [self.firstView addSubview:imageview];
    self.photoPathImageView = imageview;
    
    // 设置用户名
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 90, 100,kCellHeight)];
    label1.text = self.user.userName;
    [label1 setFont:[UIFont systemFontOfSize:20]];
    label1.textAlignment = NSTextAlignmentLeft;
    [self.firstView addSubview:label1];
    self.userNameLabel = label1;
    
    // 设置年龄
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(160, 130, 40,kCellHeight)];
    label2.text = [NSString stringWithFormat:@"%d岁",(int)self.user.age];
    [label2 setFont:[UIFont systemFontOfSize:17]];
    [label2 setTextColor:[UIColor grayColor]];
    label2.textAlignment = NSTextAlignmentLeft;
    [self.firstView addSubview:label2];
    self.ageLabel = label2;
    
    // 设置性别
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(120, 130, 140,kCellHeight)];
    label3.text = self.user.sex;
    [label3 setFont:[UIFont systemFontOfSize:17]];
    [label3 setTextColor:[UIColor grayColor]];
    label3.textAlignment = NSTextAlignmentLeft;
    [self.firstView addSubview:label3];
    self.sexLabel = label3;
    
    // 设置用户名
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(kGap, 20, 140,kCellHeight)];
    label4.text = [NSString stringWithFormat:@"Name : %@",self.user.userRealName];
    [label4 setFont:[UIFont systemFontOfSize:20]];
    [label4 setNumberOfLines:0];

    label4.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label4];
    self.userRealNameLabel = label4;
    
    // 设置籍贯
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(kGap, 60 , [UIScreen mainScreen].bounds.size.width - 2 * kGap,kCellHeight)];
    label5.text = [NSString stringWithFormat:@"Birth Place : %@",self.user.birthPlace];
    [label5 setFont:[UIFont systemFontOfSize:20]];
    [label5 setNumberOfLines:0];

    label5.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label5];
    self.userRealNameLabel = label5;
    
    // 设置地址
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(kGap, 100 , [UIScreen mainScreen].bounds.size.width - 2 * kGap,kCellHeight)];
    label6.text = [NSString stringWithFormat:@"Address : %@",self.user.userAddress];
    [label6 setFont:[UIFont systemFontOfSize:20]];
    [label6 setNumberOfLines:0];

    label6.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label6];
    self.userRealNameLabel = label6;
    
    // 设置电话
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(kGap, 140, [UIScreen mainScreen].bounds.size.width - 2 * kGap,kCellHeight)];
    label7.text = [NSString stringWithFormat:@"Telephone : %@",self.user.userTel];
    [label7 setFont:[UIFont systemFontOfSize:20]];
    [label7 setNumberOfLines:0];
    label7.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label7];
    self.userRealNameLabel = label7;
    
    // 设置邮箱
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(kGap, 180, [UIScreen mainScreen].bounds.size.width - 2 * kGap,kCellHeight)];
    label8.text = [NSString stringWithFormat:@"E-mail : %@",self.user.userEmail];
    [label8 setFont:[UIFont systemFontOfSize:20]];
    [label8 setNumberOfLines:0];
    label8.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label8];
    self.userRealNameLabel = label8;

}

- (void)personCenterLeftButton
{
    NSLog(@"personCenterLeftButton");
}

- (void)personCenterRightButton
{
    NSLog(@"personCenterRightButton");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.user setUserData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
