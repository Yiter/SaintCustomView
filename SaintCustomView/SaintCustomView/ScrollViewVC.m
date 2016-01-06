//
//  ScrollViewVC.m
//  SaintCustomView
//
//  Created by wl on 16/1/6.
//  Copyright © 2016年 saint. All rights reserved.
//

#import "ScrollViewVC.h"
#import <SDCycleScrollView.h>

@interface ScrollViewVC ()

@end

@implementation ScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
}
-(void)setUI{
    self.view.backgroundColor =randomColor;
    NSArray *URLImageArr =@[@"http://a4.att.hudong.com/72/06/01300000569933126015060048505.jpg",@"http://img6.cache.netease.com/ent/2014/12/10/20141210164907c03da.jpg",@"http://pic3.nipic.com/20090618/1593169_090158041_2.jpg"];
    NSArray *titleArr =@[@"这是第一张那个",@"这是另外一张",@"这已经是最后一张了啊"];
    SDCycleScrollView *scrollView =[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 200, mainWidth, 300)];
    scrollView.titlesGroup=titleArr;
    scrollView.placeholderImage =[UIImage imageNamed:@"NOImage"];
    scrollView.imageURLStringsGroup =URLImageArr;
    scrollView.pageControlAliment =SDCycleScrollViewPageContolAlimentRight;
    scrollView.titleLabelBackgroundColor=randomColor;
    scrollView.backgroundColor =randomColor;
    [self.view addSubview:scrollView];

}

@end
