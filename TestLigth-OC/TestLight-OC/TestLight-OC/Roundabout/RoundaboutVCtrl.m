//
//  RoundaboutVCtrl.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/6/15.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "RoundaboutVCtrl.h"
#import "RoundaboutView.h"

@interface RoundaboutVCtrl ()

@end

@implementation RoundaboutVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化View
-(void)initView{
    
    RoundaboutView *view = [[RoundaboutView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:view];
}
@end
