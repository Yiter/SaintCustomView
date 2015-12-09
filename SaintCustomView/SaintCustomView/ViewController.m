//
//  ViewController.m
//  SaintCustomView
//
//  Created by wl on 15/12/9.
//  Copyright © 2015年 saint. All rights reserved.
//

#import "ViewController.h"
#import "SaintAlertView.h"
#import "SaintActionSheet.h"
#import "SaintInputView.h"

@interface ViewController ()
@property (nonatomic,strong)SaintInputView *inputView;

@end

@implementation ViewController
-(SaintInputView *)inputView{
    if (!_inputView) {
        _inputView =[[SaintInputView alloc]init];
    }
    return _inputView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    //alert
    [self creatBtnWithTag:0 andTitle:@"CustomAlertView"];
    
    //actionSheet
    [self creatBtnWithTag:1 andTitle:@"CustomActionSheet"];
    
    //inputView
    [self creatBtnWithTag:2 andTitle:@"CustomInputView"];
    
}
-(UIButton *)creatBtnWithTag:(NSInteger)tag andTitle:(NSString *)title{
    CGFloat marginTop =100;
    CGFloat ww =[UIScreen mainScreen].bounds.size.width;
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake((ww-200)/2, marginTop+70*tag, 200, 40)];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag=tag;
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    return btn;
    
}

-(void)btnOnClick:(UIButton *)sender{
    NSInteger tag = sender.tag;
    if (tag==0) {
        //alert
        SaintAlertView *alert =[[SaintAlertView alloc]initWithTitle:@"CustomAlertView" message:@"You can write what you want visible to others" cancelButtonTitle:@"cancel" otherButtonTitle:@"sure"];
        [alert show];
    }else if (tag==1){
        //actionSheet
        SaintActionSheet *sheet =[[SaintActionSheet alloc]initWithTitle:@"选择支付方式" buttonTitles:@[@"支付宝支付",@"微信支付",@"银联支付"] redButtonIndex:-1 delegate:nil];
        [sheet show];
    }else if (tag==2){
        [self showInputViewType1];
    }
}

/** 一行输入框 */
- (void)showInputViewType1 {
    // 1. 设置数据
    self.inputView.titleLable.text = @"修改手机号";
    [self.inputView setItems:@[@"输入新的手机号"]];
    // 2. show 显示
    [self.inputView show];
    // 3. 自定义键盘
    self.inputView.textFiled1.keyboardType = UIKeyboardTypeNumberPad;
    // 4. 定义回调block
    __weak typeof(self) weakSelf = self;
    self.inputView.okButtonClickBolck = ^(NSMutableArray *arr){
        [weakSelf.inputView hide];
    };
}







@end
