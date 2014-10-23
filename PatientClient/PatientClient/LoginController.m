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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // 设置label 及 textfield属性
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, [UIScreen mainScreen].bounds.size.width / 2, 44)];
    label1.text = @"Account Name";
    [label1 setFont:[UIFont systemFontOfSize:18]];
    self.idLabel = label1;
    [self.view addSubview:label1];
    
    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 110, [UIScreen mainScreen].bounds.size.width - 40, 30)];
//    [field1 setBackgroundColor:[UIColor grayColor]];
    field1.borderStyle = UITextBorderStyleLine;
    field1.delegate = self;
    self.idTextField = field1;
    [self.view addSubview:field1];
    field1.userInteractionEnabled = YES;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width / 2, 44)];
    label2.text = @"PassWord";
    [label2 setFont:[UIFont systemFontOfSize:18]];
    self.passwordLabel = label2;
    [self.view addSubview:label2];
    
    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    field2.secureTextEntry = YES;
    field2.borderStyle = UITextBorderStyleLine;
    field2.delegate = self;
    field2.userInteractionEnabled = YES;
        
    self.passwordTextField = field2;
    [self.view addSubview:field2];
    
    
    // 登录按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 240, [UIScreen mainScreen].bounds.size.width - 40, 44)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [btn setTitle:@"Sign In" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchDown];
    self.loginBtn = btn;
    [self.view addSubview:btn];

}

- (void)Login
{
    NSLog(@"UserName:%@--password:%@",self.idTextField.text,self.passwordTextField.text);
    Account *account = [[Account alloc] init];
    account.accountName = self.idTextField.text;
    account.password = self.passwordTextField.text;
    [[AccountTool sharedAccountTool] saveAccount:account];
    self.view.window.rootViewController = [PCMainController shareMainViewController];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
