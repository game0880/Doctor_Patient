//
//  LoginController.m
//  PatientClient
//
//  Created by dlz225 on 14-10-20.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "LoginController.h"
#import "PCMainController.h"
#import "AccountTool.h"
#import "PCAPIClient.h"

@interface LoginController () <UITextFieldDelegate>
@property (nonatomic,strong) UILabel *idLabel;  //账号label
@property (nonatomic,strong) UITextField *idTextField;
@property (nonatomic,strong) UILabel *passwordLabel;    //密码label
@property (nonatomic,strong) UITextField *passwordTextField;

@property (nonatomic,strong) UIButton *loginBtn;

@end

@implementation LoginController

- (instancetype)init
{
    if (self = [super init]) {
        [self initUI];
        
    }
    return self;
}

- (void)initUI
{
    // scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    // 设置滚动size
    self.scrollView.contentSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:self.scrollView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // 设置label 及 textfield属性
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, [UIScreen mainScreen].bounds.size.width / 2, 44)];
    label1.text = @"Account Name";
    [label1 setFont:[UIFont systemFontOfSize:18]];
    self.idLabel = label1;
    [self.scrollView addSubview:label1];
    
    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    field1.borderStyle = UITextBorderStyleRoundedRect;
    field1.delegate = self;
    self.idTextField = field1;
    [self.scrollView addSubview:field1];
    field1.userInteractionEnabled = YES;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, [UIScreen mainScreen].bounds.size.width / 2, 44)];
    label2.text = @"PassWord";
    [label2 setFont:[UIFont systemFontOfSize:18]];
    self.passwordLabel = label2;
    [self.scrollView addSubview:label2];
    
    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    field2.secureTextEntry = YES;
    field2.borderStyle = UITextBorderStyleRoundedRect;
    field2.delegate = self;
    field2.userInteractionEnabled = YES;
        
    self.passwordTextField = field2;
    [self.scrollView addSubview:field2];
    
    
    // 登录按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 190, [UIScreen mainScreen].bounds.size.width - 40, 44)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [btn setTitle:@"Sign In" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchDown];
    self.loginBtn = btn;
    [self.scrollView addSubview:btn];
    
    // 监听鼠标事件
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self.scrollView addGestureRecognizer:tap];
}

#pragma mark 监听Login
- (void)Login
{
    NSLog(@"UserName:%@--password:%@",self.idTextField.text,self.passwordTextField.text);
    Account *account = [[Account alloc] init];
    account.accountName = self.idTextField.text;
    account.password = self.passwordTextField.text;
    [[AccountTool sharedAccountTool] saveAccount:account];
    
    // 账户登录
    [PCAPIClient userAuth:@"login!login" parameters:@{@"userName":self.idTextField.text,@"passWord":self.passwordTextField.text} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 判断账户是否正确
        if ([responseObject[@"loginInfo"] isEqualToString:@"loginError! "]) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Account Name or Password is wrong " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alert show];
        }
        else
        {
            NSLog(@"success!!!");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        NSLog(@"failure!!!!");
    }];
    
    self.view.window.rootViewController = [PCMainController shareMainViewController];
}


#pragma mark ---触摸关闭键盘----
-(void)handleTap:(UIGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
