//
//  EmitterVCtrl.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/3/22.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "EmitterVCtrl.h"

@interface EmitterVCtrl ()

@end

@implementation EmitterVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController setNavigationBarHidden:YES];


    //粒子图层
    CAEmitterLayer *snowLayer = [CAEmitterLayer layer];
    snowLayer.backgroundColor = [UIColor redColor].CGColor;
    snowLayer.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    //发射位置
    snowLayer.emitterPosition = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    //发射源的尺寸
    snowLayer.emitterSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //发射源的形状
    snowLayer.emitterMode = kCAEmitterLayerSurface;
    //发射模式
    snowLayer.emitterShape = kCAEmitterLayerRectangle;
    snowLayer.renderMode = kCAEmitterLayerUnordered;

    //存放粒子种类的数组
    NSMutableArray *snow_array = @[].mutableCopy;

    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    snowCell.name = @"snow";
    //产生频率
    snowCell.birthRate = 25.0f;
    //生命周期
    snowCell.lifetime = 5.0f;
    //运动速度
    snowCell.velocity = 1.0f;
    //运动速度的浮动值
    snowCell.velocityRange = 10;
    //y方向的加速度
    snowCell.yAcceleration = 10;

    snowCell.zAcceleration = 10;

    snowCell.emissionLongitude = 2.212;
    snowCell.emissionLatitude = 1.25;
    snowCell.scaleRange = 0.3;

    snowCell.xAcceleration = 10;
    //抛洒角度的浮动值
    snowCell.emissionRange = 0.5*M_PI;
    //自旋转角度范围
//    snowCell.spinRange = 0.25*M_PI;
    //粒子透明度在生命周期内的改变速度
//    snowCell.alphaSpeed = 2.0f;
    //cell的内容，一般是图片
    NSString *snow_str = [NSString stringWithFormat:@"snow"];
    snowCell.contents = (id)[UIImage imageNamed:snow_str].CGImage;

    [snow_array addObject:snowCell];

    //添加到当前的layer上
    snowLayer.shadowColor = [[UIColor redColor]CGColor];
    snowLayer.cornerRadius = 1.0f;
    snowLayer.shadowOffset = CGSizeMake(1, 1);
    snowLayer.emitterCells = [NSArray arrayWithArray:snow_array];
    [self.view.layer insertSublayer:snowLayer atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 返回状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
// 控制状态栏的现实与隐藏
- (BOOL)prefersStatusBarHidden{
    return NO;
}

@end
