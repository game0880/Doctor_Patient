//
//  LoginViewController.m
//  login
//
//  Created by 肖尧 on 14-10-18.
//  Copyright (c) 2014年 xiaoyao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

{
    //        UITextField *userInput;
    //        UITextField *passwordInput;
    NSDictionary *userInputv;
    
}

@property(nonatomic,strong) UITextField *userInput;
@property (nonatomic, strong) UITextField *passwordInput;


@property (nonatomic, strong) UITextField *testTextField;


@end

@implementation LoginViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"User Interface";
        
        
        //        [se;
        //
        //        [[NSUserDefaults standardUserDefaults] setObject:@"123456" forKey:@"nihao"];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSUserDefaults *userInputDef = [NSUserDefaults standardUserDefaults];
    [userInputDef setObject:self.userInput.text forKey:@"userID"];
    
    self.userInput = [[UITextField alloc] initWithFrame:CGRectMake(110, 100, 150, 40)];
    self.userInput.backgroundColor = [UIColor whiteColor];
    self.userInput.borderStyle = UITextBorderStyleRoundedRect;
    self.userInput.delegate = self;
    self.userInput.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter ;//文字内容 垂直居中
    self.userInput.userInteractionEnabled = YES;
    self.userInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userInput.returnKeyType = UIReturnKeyDone;
    self.userInput.keyboardType = UIKeyboardTypeDefault;
    self.userInput.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.userInput becomeFirstResponder];
    self.userInput.placeholder = @"Username";
    [self.view addSubview:self.userInput];
    
    
    
    self.passwordInput = [[UITextField alloc] initWithFrame:CGRectMake(110, 200, 150, 40)];
    self.passwordInput.backgroundColor = [UIColor whiteColor];
    self.passwordInput.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordInput.delegate = self;
    self.passwordInput.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter ;//文字内容 垂直居中
    self.passwordInput.secureTextEntry = YES;
    self.passwordInput.userInteractionEnabled = YES;
    self.passwordInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordInput.returnKeyType = UIReturnKeyDone;
    self.passwordInput.keyboardType = UIKeyboardTypeDefault;
    self.passwordInput.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.passwordInput];
    self.passwordInput.placeholder = @"Password";
    NSUserDefaults *psaawordInputDef = [NSUserDefaults standardUserDefaults];
    [psaawordInputDef setObject:self.passwordInput.text forKey:@"pwd"];
    
    
    UIButton *loginButton =[[UIButton alloc] initWithFrame:CGRectMake(100, 300, 80, 40)];
    loginButton.backgroundColor = [UIColor whiteColor];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onloginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    //    [NSUserDefaults standardUserDefaults] ;
    
    
    UIButton *registerButton =[[UIButton alloc] initWithFrame:CGRectMake(100, 350, 80, 40)];
    registerButton.backgroundColor = [UIColor whiteColor];
    [registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pushRVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    userName.backgroundColor = [UIColor whiteColor];
    userName.text = @"Username:";
    [self.view addSubview:userName];
    
    
    UILabel *passWord= [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 100, 40)];
    passWord.backgroundColor = [UIColor whiteColor];
    passWord.text = @"Password:";
    [self.view addSubview:passWord];
    
    
    UITextField *textfield = [[UITextField alloc] init];
    textfield.backgroundColor = [UIColor redColor];
    self.testTextField = textfield;
    
    [self.view addSubview:textfield];
    
    // Do any additional setup after loading the view.
}

- (void)pushRVC
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}





-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    [self resignFirstResponder];
//}


#pragma mark -------------------
#pragma mark textFieldButton 的响应函数
- (void)onloginButtonClicked:(UIButton*)button{
    [self dologin];
    //[self.passwordInput resignFirstResponder];
    
}
- (void)dologin
{
    NSString *name = self.userInput.text;
    NSString *pwd = self.passwordInput.text;
    NSString *message = [[NSString alloc] init];
    if (name == nil) {
        message = @"Account can not be empty";
    }else if (pwd == nil){
        message = @ "Password can not be empty";
    }else{
        
    }
}

//以下是UITextFieldDelegate 的部分委托实现
#pragma mark -------------------
#pragma mark UITextFieldDelegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)userInput{
    // return NO to disallow editing.
    return YES;
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self.userInput resignFirstResponder];
//
//}
- (void)textFieldDidBeginEditing:(UITextField *)userInput{
    // became first responder
    
    
    // 在这里监听UITextField becomeFirstResponder事件
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)userInput{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)userInput{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    // 在这里监听UITextField resignFirstResponder事件
}
- (BOOL)textField:(UITextField *)_userInput shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // return NO to not change text
    if (range.location > 20)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@" Length cannot be greater than 20" delegate:nil cancelButtonTitle:@"close" otherButtonTitles:nil];
        [alertView show];
        
        
        return NO;
    }
    NSLog(@"inputText: %@", self.userInput.text);
    return YES;
}



#pragma mark -------------------
#pragma mark UITextFieldDelegate

- (BOOL)textFieldInputShouldBeginEditing:(UITextField *)passwordInput{
    // return NO to disallow editing.
    return YES;
}
- (void)textFieldInputDidBeginEditing:(UITextField *)passwordInput{
    // became first responder
    // 在这里监听UITextField becomeFirstResponder事件
}
- (BOOL)textFieldInputShouldEndEditing:(UITextField *)passwordInput{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    return YES;
}
- (void)ptextFieldInputDidEndEditing:(UITextField *)passwordInput{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    // 在这里监听UITextField resignFirstResponder事件
}
- (BOOL)passwordInput:(UITextField *)passwordInput shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    
    // return NO to not change text
    if (range.location > 20)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@" Length cannot be greater than 20" delegate:nil cancelButtonTitle:@"close" otherButtonTitles:nil];
        [alertView show];
        
        
        return NO;
    }
    NSLog(@"inputText: %@", passwordInput.text);
    return YES;
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
