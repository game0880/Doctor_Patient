//
//  HomeController.m
//  PatientClient
//
//  Created by dlz225 on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "HomeController.h"
#define kLabelHeight 44     
#define kCellHeight 60
#define kGap 10     // 设置屏幕两边的间距
#define kTableViewWidth [UIScreen mainScreen].bounds.size.width-2*kGap
#define kButtonHeight 50

@interface HomeController () <UITableViewDataSource,UITableViewDelegate>
{
    UILabel *_titleLabel;
    UITableView *_msgTableView;
    NSMutableArray *_msgArray;
}
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // 设置基本属性
    [self initProperty];
    
}

#pragma mark 设置基本属性
- (void)initProperty
{
    self.title = @"TeleMedicine";

    // 左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"navigationbar_pop@2x.png"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    UIImage *image2 = [UIImage imageNamed:@"navigationbar_pop_highlighted@2x.png"];
    [btn setBackgroundImage:image2 forState:UIControlStateHighlighted];
    btn.bounds = (CGRect){CGPointZero,image.size};
    
    [btn addTarget:self action:@selector(homeLeftButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Action" style:UIBarButtonItemStylePlain target:self action:@selector(homeRightButton)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 设置消息框标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"NEWSFLASH";
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    CGRect windowBounds = [UIScreen mainScreen].bounds;
    _titleLabel.frame = CGRectMake(0, windowBounds.size.height * 0.13, windowBounds.size.width, kLabelHeight);
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_titleLabel];
    
    // 创建假数据
    _msgArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        NSString *s = @"das的撒的飞阿尔穷人多发发发撒旦法撒旦法师法师的范德萨发";
        [_msgArray addObject:s];
    }
    // 如果小于5，则可以全部显示出来，大于5要恢复弹簧效果
    if (_msgArray.count <= 3)
    {
        // 设置消息
        _msgTableView = [[UITableView alloc] initWithFrame:CGRectMake(kGap, _titleLabel.frame.origin.y + kLabelHeight , kTableViewWidth, _msgArray.count * kCellHeight) style:UITableViewStylePlain];
        // 去掉弹簧效果
        _msgTableView.bounces = NO;
    }
    else
    {
        // 设置消息
        _msgTableView = [[UITableView alloc] initWithFrame:CGRectMake(kGap, _titleLabel.frame.origin.y + kLabelHeight , kTableViewWidth, 3 * kCellHeight) style:UITableViewStylePlain];
        // 恢复弹簧效果
        _msgTableView.bounces = YES;
    }

    _msgTableView.dataSource = self;
    _msgTableView.delegate = self;
    // 去掉灰色下划线
    _msgTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_msgTableView];
    
    // start按钮
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(2 * kGap, _msgTableView.frame.origin.y + _msgTableView.frame.size.height + 20, kTableViewWidth - 2 *kGap, kButtonHeight);
    [startBtn setBackgroundColor:[UIColor blueColor]];
    [startBtn setTitle:@"Start New Chat" forState:UIControlStateNormal];
    [startBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [startBtn addTarget:self action:@selector(startNewChat) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    // Resume按钮
    UIButton *ResumeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ResumeBtn.frame = CGRectMake(2 * kGap, startBtn.frame.origin.y + kButtonHeight + 20, kTableViewWidth - 2 *kGap, kButtonHeight);
    [ResumeBtn setBackgroundColor:[UIColor blueColor]];
    [ResumeBtn setTitle:@"Resume Previous Chat" forState:UIControlStateNormal];
    [ResumeBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [ResumeBtn addTarget:self action:@selector(ResumeChat) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ResumeBtn];
}

- (void)startNewChat
{
    NSLog(@"Start New Chat");
}

- (void)ResumeChat
{
    NSLog(@"Resume Previous Chat");
}

- (void)homeLeftButton
{
    NSLog(@"左边按钮");
}

- (void)homeRightButton
{
    NSLog(@"右边按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _msgArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentical = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentical];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentical];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.numberOfLines = 0;
    [cell.textLabel setFont:[UIFont systemFontOfSize:17]];
    cell.textLabel.text = _msgArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

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
