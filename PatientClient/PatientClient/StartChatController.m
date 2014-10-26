//
//  StartChatController.m
//  PatientClient
//
//  Created by dlz225 on 14-10-22.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "StartChatController.h"
#import "PersonCenterController.h"
#import "startCell.h"
#import "DialogController.h"

@interface StartChatController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation StartChatController

- (id)init
{
    if (self = [super init]) {
        // 创建基本界面
        [self initUI];
        
        [self addData];
        
    }
    return self;
}

- (void)initUI
{
    // 标题
    self.title = @"New Chat";
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    // 设置滚动size
    self.scrollView.contentSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height + 1);
    [self.view addSubview:self.scrollView];
    
    // 左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"navigationbar_pop@2x.png"];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    UIImage *image2 = [UIImage imageNamed:@"navigationbar_pop_highlighted@2x.png"];
    [btn setBackgroundImage:image2 forState:UIControlStateSelected];
    btn.bounds = (CGRect){CGPointZero,image.size};
//    [btn addTarget:self action:@selector(LeftButton) forControlEvents:UIControlEventTouchUpInside];
    self.leftItem = btn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 右边按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(RightButton)];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    
    // tableview
    UITableView *tabView = [[UITableView alloc] initWithFrame:CGRectMake(15, 60, [UIScreen mainScreen].bounds.size.width - 2 * 15, 500) style:UITableViewStylePlain];
    // 去掉灰色下划线
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tabView.dataSource = self;
    tabView.delegate = self;
    [self.scrollView addSubview:tabView];
    self.tableView = tabView;

}

- (void)RightButton
{

}

- (void)addData
{
    // 初始化数组
    NSArray *Arr = @[@{@"doctName":@"Doctor A",@"subjects":@"风湿内科",@"status":@"off"},@{@"doctName":@"Doctor B",@"subjects":@"关节炎",@"status":@"on"},@{@"doctName":@"Doctor C",@"subjects":@"眼科",@"status":@"on"},@{@"doctName":@"Doctor D",@"subjects":@"骨科",@"status":@"off"}];
    _array = [NSMutableArray arrayWithArray:Arr];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentical = @"startCell";
    startCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentical];
    if (!cell) {
        cell = [[startCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentical];
        cell.dataArray = self.array;
    }
    cell.indexPath = indexPath;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DialogController *dialog = [[DialogController alloc] init];
    startCell *start = (startCell *)[tableView cellForRowAtIndexPath:indexPath];
    dialog.doctorContentLabel.text = start.doctorName.text;
    dialog.subjectContentLabel.text = start.subject.text;
    [self.navigationController pushViewController:dialog animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
