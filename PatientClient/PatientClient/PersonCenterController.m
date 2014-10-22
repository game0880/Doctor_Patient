//
//  PersonCenterController.m
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "PersonCenterController.h"
#import "UserCell.h"

#define kPropertyCount 9
#define kCellHeight 40
#define kGap 13

@interface PersonCenterController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userRealNameLabel;
@property (nonatomic,strong) UITextField *ageTextField;
@property (nonatomic,strong) UITextField *sexTextField;
@property (nonatomic,strong) UILabel *birthPlaceLabel;
@property (nonatomic,strong) UILabel *userAddressLabel;
@property (nonatomic,strong) UIButton *photoPathBtn;  //用户头像
@property (nonatomic,strong) UILabel *userTelLabel;

@property (nonatomic,strong) UIView *firstView; //包含头像、用户名、性别、年龄
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *personArray;
@property (nonatomic,strong) NSMutableArray *titleArray;

@property (nonatomic,assign) BOOL canEdit;  // 是否能修改状态
@end

@implementation PersonCenterController

- (id)init
{
    if (self = [super init]) {
        // 创建基本界面
        [self initUI];
        
        self.user = [User shareUser];
        // 设置假数据
        [self.user setUserData:nil];
        
        // 创建用户基本信息界面
        [self initUserUI];
    }
    return self;
}

- (void)initUI
{
    // 标题
    self.title = @"Person Center";
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    // 设置滚动size
    self.scrollView.contentSize = CGSizeMake(0, 1000);
    [self.view addSubview:self.scrollView];
    
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(personCenterRightButton)];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    
    // 确定view
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(kGap, 0, [UIScreen mainScreen].bounds.size.width - 2 * kGap, 120)];
//    [v1 setBackgroundColor:[UIColor redColor]];
    self.firstView = v1;
    [self.scrollView addSubview:v1];
    
    // 确定tableView
    UITableView *tabView = [[UITableView alloc] initWithFrame:CGRectMake(kGap, 100, [UIScreen mainScreen].bounds.size.width - 2 * kGap, [UIScreen mainScreen].bounds.size.height - 120)];

    tabView.delegate = self;
    tabView.dataSource = self;
    [self.scrollView addSubview:tabView];
    self.tableView = tabView;
    
    self.canEdit = NO;
    
}

- (void)initUserUI
{
    
    // 设置头像
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn.frame = CGRectMake(kGap, kGap, 80, 80);
    // 设置成圆角
    [imageBtn.layer setMasksToBounds:YES];
    [imageBtn.layer setCornerRadius:40];
    
    [imageBtn setBackgroundImage:[UIImage imageNamed:self.user.photoPath] forState:UIControlStateNormal];
    [imageBtn addTarget:self action:@selector(changeIcon) forControlEvents:UIControlEventTouchUpInside];
    [self.firstView addSubview:imageBtn];
    
    self.photoPathBtn = imageBtn;
    
    // 设置用户名
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(120, kGap, 100,kCellHeight)];
    label1.text = self.user.userName;
    [label1 setFont:[UIFont systemFontOfSize:20]];
    label1.textAlignment = NSTextAlignmentLeft;
    [self.firstView addSubview:label1];
    self.userNameLabel = label1;
    
    // 设置年龄
    UITextField *f1 = [[UITextField alloc] initWithFrame:CGRectMake(160, kGap + 40, 40,kCellHeight)];
    f1.text = [NSString stringWithFormat:@"%d岁",(int)self.user.age];
    [f1 setFont:[UIFont systemFontOfSize:17]];
    f1.enabled = _canEdit;
    [self.firstView addSubview:f1];
    self.ageTextField = f1;
    
    // 设置性别
    UITextField *f2 = [[UITextField alloc] initWithFrame:CGRectMake(120, kGap + 40, 80,kCellHeight)];
    f2.text = self.user.sex;
    [f2 setFont:[UIFont systemFontOfSize:17]];
    f2.enabled = _canEdit;
    [self.firstView addSubview:f2];
    self.sexTextField = f2;
    
    // 将user内容加载到array中
    [self addUserData];

}

- (void)addUserData
{
    _personArray = [NSMutableArray array];
    NSString *s1 = [NSString stringWithFormat:@"%@",self.user.userRealName];
    NSString *s2 = [NSString stringWithFormat:@"%@",self.user.birthPlace];
    NSString *s3 = [NSString stringWithFormat:@"%@",self.user.userAddress];
    NSString *s4 = [NSString stringWithFormat:@"%@",self.user.userTel];
    NSString *s5 = [NSString stringWithFormat:@"%@",self.user.userEmail];

    [_personArray addObject:s1];
    [_personArray addObject:s2];
    [_personArray addObject:s3];
    [_personArray addObject:s4];
    [_personArray addObject:s5];
    
    _titleArray = [NSMutableArray array];
    [_titleArray addObject:@"Name :"];
    [_titleArray addObject:@"Birth Place : "];
    [_titleArray addObject:@"Address : "];
    [_titleArray addObject:@"Telephone : "];
    [_titleArray addObject:@"E-mail : "];

}

- (void)changeIcon
{
    for (int i = 0; i <_titleArray.count; i++) {
        NSLog(@"%@",_titleArray[i]);
    }
}

- (void)personCenterRightButton
{
    NSLog(@"personCenterRightButton");
    self.canEdit = !_canEdit;
    [self.tableView reloadData];
}

- (void)Edit:(id)sender
{
    NSLog(@"%f",[sender X]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.user setUserData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentical = @"personCell";
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentical];
    if (!cell) {
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentical];
    }
    
    cell.title.text = _titleArray[indexPath.row];
    cell.content.text = _personArray[indexPath.row];
    cell.content.enabled = _canEdit;
    
    UIButton *modify = [[UIButton alloc] init];
    modify.bounds = CGRectMake(0, 0, 30, 30);
    [modify setBackgroundImage:[UIImage imageNamed:@"edit-file.png"] forState:UIControlStateNormal];
//    [modify addTarget:self action:@selector(modifyContent:) forControlEvents:UIControlEventTouchUpInside];
    modify.hidden = YES;
    cell.accessoryView = modify;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (void)modifyContent:(id)sender
//{
//    static NSIndexPath *lastIndexPath = nil;
//    
//    // 1.获取cell及indexPath
//    UserCell *viewCell = (UserCell *)[sender superview];
//    NSIndexPath *indexpath = [self.tableView indexPathForCell:viewCell];
//    // 2.设置相关属性
//    
//    if (lastIndexPath == nil) {
//        viewCell.content.enabled = YES;
//        [viewCell.content selectAll:viewCell.content];
//    }
//    else if (lastIndexPath == indexpath)
//    {
//        viewCell.content.enabled = NO;
//
//    }
//    else
//    {
//        UserCell *Cell = (UserCell *)[self.tableView cellForRowAtIndexPath:lastIndexPath];
//        Cell.content.enabled = NO;
//        viewCell.content.enabled = YES;
//
//        [viewCell.content selectAll:viewCell.content];
//    }
//    
//    // 3.当点击下一个时，保存现在的属性
//    _personArray[indexpath.row] = viewCell.content.text;
//    lastIndexPath = indexpath;
//    NSLog(@"now--%@//last--%@",_personArray[indexpath.row],_personArray[0]);
//    //    viewCell.content.enabled = YES;
//    
//}

// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
}

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
