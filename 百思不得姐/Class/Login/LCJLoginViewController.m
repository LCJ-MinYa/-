//
//  LCJLoginViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/25.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJLoginViewController.h"
#import "LCJThirdPartyLoginBtn.h"

@interface LCJLoginViewController ()
@property (nonatomic, weak) UIView * loginView;
@property (nonatomic, weak) UIView * registerView;
@end

@implementation LCJLoginViewController

#pragma mark 设置状态栏文本颜色
/*
 *  -(BOOL)prefersStatusBarHidden
 *  控制状态栏是否显示
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
    
    //顶部关闭和切换注册登录
    [self setHeader];
    
    //登陆内容界面
    [self setLoginView];
    
    //注册内容界面
    [self setRegisterView];
    
    //第三方登录view
    [self setThirdPartyLogin];
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    UIImage * backGroundImage=[UIImage imageNamed:@"login_register_background"];
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    self.view.layer.contents = (__bridge id _Nullable)(backGroundImage.CGImage);
}

#pragma mark 设置header[UI]
-(void)setHeader
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 40)];
    
    //左边关闭按钮
    UIButton * closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 40, 40)];
    [closeBtn setImage:[UIImage imageNamed: @"login_close_icon"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:closeBtn];
    
    //右边切换注册登录按钮
    UIButton * switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(view.lcj_width - 85, 0, 80, 40)];
    [switchBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [switchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [switchBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    switchBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [switchBtn addTarget:self action:@selector(showLoginOrRegister:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:switchBtn];
    
    [self.view addSubview:view];
}

#pragma mark 设置登录页面内容[UI]
-(void)setLoginView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 200)];
    self.loginView = view;
    
    //添加输入框背景
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_rgister_textfield_bg"]];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, imageView.lcj_height/2);
    imageView.userInteractionEnabled = YES;
    [view addSubview:imageView];
    //添加输入框
    [self setTextField:imageView frame:CGRectMake(10, 0, imageView.lcj_width-20, imageView.lcj_height/2) placeholder:@"请输入手机号" fontSize:14 keyBoardType:UIKeyboardTypePhonePad isPassWord:false];
    [self setTextField:imageView frame:CGRectMake(10, imageView.lcj_height/2, imageView.lcj_width-20, imageView.lcj_height/2) placeholder:@"请输入密码" fontSize:14 keyBoardType:UIKeyboardTypeDefault isPassWord:true];
    
    //添加登陆按钮
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 120, imageView.lcj_width, 36)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button_click"] forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    loginBtn.center = CGPointMake(SCREEN_WIDTH/2, 138);
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [view addSubview:loginBtn];
    
    //忘记密码按钮
    UIButton * forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(loginBtn.lcj_width + loginBtn.lcj_x - 70, loginBtn.lcj_y + loginBtn.lcj_height + 10, 70, 30)];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:forgetBtn];
    
    [self.view addSubview:view];
}


#pragma mark 设置注册页面内容[UI]
-(void)setRegisterView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(self.loginView.lcj_x + SCREEN_WIDTH, 120, SCREEN_WIDTH, 200)];
    self.registerView = view;
    
    //添加输入框背景
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_rgister_textfield_bg"]];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, imageView.lcj_height/2);
    imageView.userInteractionEnabled = YES;
    [view addSubview:imageView];
    //添加输入框
    [self setTextField:imageView frame:CGRectMake(10, 0, imageView.lcj_width-20, imageView.lcj_height/2) placeholder:@"请输入手机号" fontSize:14 keyBoardType:UIKeyboardTypePhonePad isPassWord:false];
    [self setTextField:imageView frame:CGRectMake(10, imageView.lcj_height/2, imageView.lcj_width-20, imageView.lcj_height/2) placeholder:@"请设置密码" fontSize:14 keyBoardType:UIKeyboardTypeDefault isPassWord:true];
    
    //添加登陆按钮
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 120, imageView.lcj_width, 36)];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_register_button_click"] forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    loginBtn.center = CGPointMake(SCREEN_WIDTH/2, 138);
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    [view addSubview:loginBtn];
    
    [self.view addSubview:view];
}

#pragma mark 设置登录页面输入框属性共用[UI]
-(void)setTextField:(UIImageView *)imageView frame:(CGRect)frame placeholder:(NSString *)placeholder fontSize:(int)fontSize keyBoardType:(UIKeyboardType)keyBoardType isPassWord:(BOOL)isPassWord
{
    UITextField * textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder = placeholder;
    [textField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:[UIFont boldSystemFontOfSize:fontSize] forKeyPath:@"_placeholderLabel.font"];
    [textField addTarget:self action:@selector(editingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textField addTarget:self action:@selector(editingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.textColor = [UIColor whiteColor];
    textField.keyboardType = keyBoardType;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.tintColor = [UIColor whiteColor];
    if(isPassWord){
        textField.secureTextEntry = YES;
    }
    [imageView addSubview:textField];
}


#pragma mark 设置第三方登录[UI]
-(void)setThirdPartyLogin
{
    UIView * thirdPartyLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 170, SCREEN_WIDTH, 150)];
    thirdPartyLoginView.backgroundColor = [UIColor clearColor];
    
    UIView * thirdPartyLoginTitle = [self setThirdPartyLoginTitle];
    UIView * thirdPartyLoginBtn = [self setThirdPartyLoginBtn];
    [thirdPartyLoginView addSubview:thirdPartyLoginTitle];
    [thirdPartyLoginView addSubview:thirdPartyLoginBtn];
    [self.view addSubview:thirdPartyLoginView];
}

#pragma mark 设置第三方登录标题[UI]
-(UIView *)setThirdPartyLoginTitle
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    //创建标题
    UILabel * title = [[UILabel alloc] init];
    title.text = @"快速登录";
    title.font = [UIFont systemFontOfSize:14];
    [title setTextColor:[UIColor whiteColor]];
    [title sizeToFit];
    title.center = CGPointMake(SCREEN_WIDTH / 2, 15);
    [view addSubview:title];
    
    //左边线
    UIImageView * leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_left_line"]];
    [leftImg sizeToFit];
    leftImg.center = CGPointMake(SCREEN_WIDTH / 2 - title.frame.size.width / 2 - leftImg.frame.size.width/2 - 10, 15);
    [view addSubview:leftImg];

    //右边线
    UIImageView * rightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_right_line"]];
    [rightImg sizeToFit];
    rightImg.center = CGPointMake(SCREEN_WIDTH / 2 + title.frame.size.width / 2 + rightImg.frame.size.width/2 + 5, 15);
    [view addSubview:rightImg];
    
    return view;
}

#pragma mark 设置第三方登录按钮[UI]
-(UIView *)setThirdPartyLoginBtn
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 110)];

    [self creatBtn:view itemLenght:3 itemIndex:0 image:@"login_QQ_icon" selectedImage:@"login_QQ_icon_click" title:@"QQ登录"];
    [self creatBtn:view itemLenght:3 itemIndex:1 image:@"login_sina_icon" selectedImage:@"login_sina_icon_click" title:@"微博登录"];
    [self creatBtn:view itemLenght:3 itemIndex:2 image:@"login_tecent_icon" selectedImage:@"login_tecent_icon_click" title:@"腾讯微博"];
    
    return view;
}

#pragma mark 设置第三方登录按钮共用方法[UI]
-(void)creatBtn:(UIView *)view itemLenght:(int)itemLenght itemIndex:(int)itemIndex image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    LCJThirdPartyLoginBtn * button = [[LCJThirdPartyLoginBtn alloc] initWithFrame:CGRectMake(view.lcj_width / itemLenght * itemIndex, 0, view.lcj_width / itemLenght, 110)];
    [button setImage:[UIImage imageNamed: image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed: selectedImage] forState:UIControlStateHighlighted];
    [button setTitle: title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:button];
}

#pragma mark 点击切换显示注册或者登陆
-(void)showLoginOrRegister:(UIButton *)button
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        if(self.loginView.lcj_x == 0){
            [button setTitle:@"已有账号" forState:UIControlStateNormal];
            self.loginView.lcj_x = -SCREEN_WIDTH;
            self.registerView.lcj_x = 0;
        }else{
            [button setTitle:@"注册账号" forState:UIControlStateNormal];
            self.loginView.lcj_x = 0;
            self.registerView.lcj_x = SCREEN_WIDTH;
        }
    }];
}

#pragma mark 监听文本输入框获取焦点切换placeholder字体颜色
-(void)editingDidBegin:(UITextField *)textField
{
    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

#pragma mark 监听文本输入框失去焦点切换placeholder字体颜色
-(void)editingDidEnd:(UITextField *)textField
{
    [textField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
}

#pragma mark 点击关闭登陆界面方法
-(void)closeLoginBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
