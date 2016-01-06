//
//  ProgressVC.m
//  SaintCustomView
//
//  Created by wl on 16/1/6.
//  Copyright © 2016年 saint. All rights reserved.
//

#import "ProgressVC.h"
#import "ToastManager.h"


@interface ProgressVC ()

@end

@implementation ProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =randomColor;
    self.title=@"progressView";
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    btn.backgroundColor =randomColor;
    [btn setTitle:@"showToastView" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center =self.view.center;
}

-(void)btnOnClick:(UIButton *)sender{
    int number;
    number =arc4random()%4;
    switch (number) {
        case 0:
            [[ToastManager ShardInstance]showHUD:arc4random()%14];
            [self performSelector:@selector(hidethis) withObject:nil afterDelay:2.0f];
            break;
        case 1:
            [[ToastManager ShardInstance]showprogress];
            [self performSelector:@selector(hidethis) withObject:nil afterDelay:2.0f];
            break;
        case 2:
            [[ToastManager ShardInstance]showtoast:@"您输入的密码有错误"];
            break;
        case 3:
            [[ToastManager ShardInstance]showtoast:@"等待几秒才出现的" wait:2.0];
            break;
        default:
            break;
    }
}
-(void)hidethis{
    [[ToastManager ShardInstance]hideprogress];
}
@end
