//
//  RoundaboutView.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/6/15.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "RoundaboutView.h"
#import <Masonry/Masonry.h>
#import <QMUIKit/QMUIKit.h>
#import <YYCategories/YYCategories.h>
#import "PrizeView.h"
#import <ZZCircleProgress/ZZCircleProgress.h>

@interface RoundaboutView()<CAAnimationDelegate>

@property(nonatomic, strong) UIView *containerView;

///大转盘背景
@property(nonatomic, strong) UIImageView *bgImageView;
@property BOOL isAnimation;

@property CGFloat circleAngle;

///倒计时
@property(nonatomic, strong) ZZCircleProgress *countDownProgress;

///暴走值
@property(nonatomic, strong) ZZCircleProgress *crazyProgress;

@property(nonatomic, strong) UIButton *juanBtn1;
@property(nonatomic, strong) UIButton *juanBtn2;
@property(nonatomic, strong) UIButton *juanBtn3;

@end

@implementation RoundaboutView

-(void)hideAction:(id)sender{
    
    [self removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIView *backgroundView = [UIView new];
        [backgroundView setUserInteractionEnabled:YES];
        [self addSubview:backgroundView];
        [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.right.and.top.and.bottom.equalTo(self);
        }];
        
        UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAction:)];
        [backgroundView addGestureRecognizer:backgroundTap];
        
        //容器
        self.containerView = [UIView new];
        [self.containerView setBackgroundColor:[UIColor blackColor]];
        [self addSubview:self.containerView];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.and.bottom.and.right.equalTo(self);
            make.height.mas_equalTo(470);
        }];
        
        //我的记录
        UIButton *myRecordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [myRecordBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [myRecordBtn setTitle:@"我的记录" forState:UIControlStateNormal];
        [myRecordBtn setTitleColor:[UIColor colorWithRed:0.737 green:0.737 blue:0.737 alpha:1.00] forState:UIControlStateNormal];
        [myRecordBtn addTarget:self action:@selector(myRecordAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:myRecordBtn];
        [myRecordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(42);
            make.left.equalTo(self.containerView).with.offset(0);
            make.bottom.equalTo(self.containerView).with.offset(0);
            make.right.equalTo(self.containerView.mas_centerX).with.offset(0);
        }];

        //玩法介绍
        UIButton *howToPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [howToPlayBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [howToPlayBtn setTitle:@"玩法介绍" forState:UIControlStateNormal];
        [howToPlayBtn setTitleColor:[UIColor colorWithRed:0.737 green:0.737 blue:0.737 alpha:1.00] forState:UIControlStateNormal];
        [howToPlayBtn addTarget:self action:@selector(myRecordAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:howToPlayBtn];
        [howToPlayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(42);
            make.right.equalTo(self.containerView).with.offset(0);
            make.bottom.equalTo(self.containerView).with.offset(0);
            make.left.equalTo(self.containerView.mas_centerX).with.offset(0);
        }];

        //画两条线
        UIView *lineView1 = [[UIView alloc] init];
        [lineView1 setBackgroundColor:[UIColor colorWithRed:0.094 green:0.090 blue:0.094 alpha:1.00]];
        [self.containerView addSubview:lineView1];
        [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(1);
            make.top.equalTo(myRecordBtn.mas_top).with.offset(0);
            make.left.equalTo(myRecordBtn.mas_right).with.offset(0);
            make.bottom.equalTo(myRecordBtn.mas_bottom).with.offset(0);
        }];

        UIView *lineView2 = [[UIView alloc] init];
        [lineView2 setBackgroundColor:[UIColor colorWithRed:0.094 green:0.090 blue:0.094 alpha:1.00]];
        [self.containerView addSubview:lineView2];
        [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.left.and.right.equalTo(self.containerView);
            make.bottom.equalTo(myRecordBtn.mas_top).with.offset(0);
        }];
        
        //购买1张黄金券为主播争榜，并获赠1次转盘机会
        UILabel *tipsLabel = [[UILabel alloc] init];
        [tipsLabel setFont:[UIFont systemFontOfSize:10]];
        [tipsLabel setText:@"购买1张黄金券为主播争榜，并获赠1次转盘机会"];
        [tipsLabel setTextAlignment:NSTextAlignmentCenter];
        [tipsLabel setTextColor:[UIColor colorWithRed:0.741 green:0.741 blue:0.741 alpha:1.00]];
        [tipsLabel setBackgroundColor:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:.15]];
        tipsLabel.layer.cornerRadius = 10;
        tipsLabel.clipsToBounds = YES;
        [self.containerView addSubview:tipsLabel];
        [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(247);
            make.centerX.equalTo(self.containerView).with.offset(0);
            make.bottom.equalTo(lineView2.mas_top).with.offset(-7);
        }];

        //黄金券三个按钮
        self.juanBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.juanBtn1 setBackgroundImage:[UIImage imageNamed:@"cp_button_4"] forState:UIControlStateNormal];
        [self.juanBtn1 setBackgroundImage:[UIImage imageNamed:@"cp_button_4_1"] forState:UIControlStateSelected];
        [self.containerView addSubview:self.juanBtn1];
        
        self.juanBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.juanBtn2 setBackgroundImage:[UIImage imageNamed:@"cp_button_4"] forState:UIControlStateNormal];
        [self.juanBtn2 setBackgroundImage:[UIImage imageNamed:@"cp_button_4_1"] forState:UIControlStateSelected];
        [self.containerView addSubview:self.juanBtn2];

        self.juanBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.juanBtn3 setBackgroundImage:[UIImage imageNamed:@"cp_button_4"] forState:UIControlStateNormal];
        [self.juanBtn3 setBackgroundImage:[UIImage imageNamed:@"cp_button_4_1"] forState:UIControlStateSelected];
        [self.containerView addSubview:self.juanBtn3];

        CGFloat juanBtnWidth = (SCREEN_WIDTH - 15*2 - 5*2)/3;
        
        [self.juanBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.containerView);
            make.width.mas_equalTo(juanBtnWidth);
            make.height.mas_equalTo(30);
            make.bottom.equalTo(tipsLabel.mas_top).with.offset(-11);
        }];
        
        [self.juanBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.juanBtn2.mas_left).with.offset(-5);
            make.width.mas_equalTo(juanBtnWidth);
            make.height.mas_equalTo(30);
            make.bottom.equalTo(tipsLabel.mas_top).with.offset(-11);
        }];
        
        [self.juanBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.juanBtn2.mas_right).with.offset(5);
            make.width.mas_equalTo(juanBtnWidth);
            make.height.mas_equalTo(30);
            make.bottom.equalTo(tipsLabel.mas_top).with.offset(-11);
        }];
        
        //上面的线
        UIView *lineView3 = [[UIView alloc] init];
        [lineView3 setBackgroundColor:[UIColor colorWithRed:0.094 green:0.090 blue:0.094 alpha:1.00]];
        [self.containerView addSubview:lineView3];
        [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.left.and.right.equalTo(self.containerView);
            make.top.equalTo(self.containerView.mas_top).with.offset(39);
        }];
        
        //排行榜按钮
        UIButton *bangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bangBtn setImage:[UIImage imageNamed:@"zp_button_3"] forState:UIControlStateNormal];
//        [bangBtn addTarget:self action:@selector(<#action name#>) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:bangBtn];
        [bangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self.containerView).with.offset(18);
            make.top.equalTo(lineView3.mas_bottom).with.offset(12);
        }];


        //转盘大背景
        self.bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zp_bg_1"]];
        [self.bgImageView setUserInteractionEnabled:YES];
        [self.containerView addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self.containerView);
            make.top.equalTo(self.containerView).with.offset(70);
        }];
        
        //倒计时
        self.countDownProgress = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 280, 280) pathBackColor:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:.15] pathFillColor:[UIColor colorWithRed:0.463 green:0.200 blue:0.267 alpha:1.00] startAngle:125 strokeWidth:8];
        self.countDownProgress.reduceAngle = 250;
        self.countDownProgress.showPoint = NO;
        self.countDownProgress.showProgressText = NO;
        self.countDownProgress.progress = 0.8;
        [self.containerView addSubview:self.countDownProgress];
        [self.countDownProgress mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self.bgImageView);
            make.width.and.height.mas_equalTo(280);
        }];
        
        //提示
        UILabel *countDownLabel = [[UILabel alloc] init];
        [countDownLabel setFont:[UIFont systemFontOfSize:11]];
        [countDownLabel setText:@"倒计时"];
        [countDownLabel setTextAlignment:NSTextAlignmentRight];
        [countDownLabel setTextColor:[UIColor colorWithRed:0.741 green:0.741 blue:0.741 alpha:1.00]];
        [self.containerView addSubview:countDownLabel];
        [countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(12);
            make.top.equalTo(self.bgImageView.mas_bottom).with.offset(0);
            make.left.equalTo(self.containerView).with.offset(0);
            make.right.equalTo(self.containerView.mas_centerX).with.offset(-50);
        }];
        
        //暴走值
        self.crazyProgress = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 280, 280) pathBackColor:[UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:.15] pathFillColor:[UIColor colorWithRed:1.000 green:0.773 blue:0.220 alpha:1.00] startAngle:125 strokeWidth:8];
        self.crazyProgress.reduceAngle = 250;
        self.crazyProgress.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.crazyProgress.showPoint = NO;
        self.crazyProgress.showProgressText = NO;
        self.crazyProgress.progress = 0.8;
        [self.containerView addSubview:self.crazyProgress];
        [self.crazyProgress mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self.bgImageView);
            make.width.and.height.mas_equalTo(280);
        }];

        //提示
        UILabel *crazyLabel = [[UILabel alloc] init];
        [crazyLabel setFont:[UIFont systemFontOfSize:11]];
        [crazyLabel setText:@"暴走值"];
        [crazyLabel setTextAlignment:NSTextAlignmentLeft];
        [crazyLabel setTextColor:[UIColor colorWithRed:0.741 green:0.741 blue:0.741 alpha:1.00]];
        [self.containerView addSubview:crazyLabel];
        [crazyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(12);
            make.top.equalTo(self.bgImageView.mas_bottom).with.offset(0);
            make.right.equalTo(self.containerView).with.offset(0);
            make.left.equalTo(self.containerView.mas_centerX).with.offset(50);
        }];

        //转盘小背景
        UIImageView *smallBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zb_bg_3"]];
        [self.bgImageView addSubview:smallBgView];
        [smallBgView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self.bgImageView);
        }];

        
        //添加GO按钮
        UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [goBtn setImage:[UIImage imageNamed:@"zp_button_1"] forState:UIControlStateNormal];
        [goBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:goBtn];
        [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(90);
            make.width.mas_equalTo(61);
            make.centerX.equalTo(self.bgImageView);
            make.centerY.equalTo(self.bgImageView).with.offset(1);
        }];
        
        //添加文字
        NSArray *_prizeArray = @[@"未中奖",@"一等奖",@"二等奖",@"三等奖",@"四等奖",@"五等奖",@"六等级",@"七等奖",@"八等奖"];
        
        for (int i = 0; i < 9; i ++) {

            PrizeView *prizeView = [[PrizeView alloc] initWithFrame:CGRectMake(0, 0,M_PI * CGRectGetHeight(_bgImageView.frame)/9,100)];
            prizeView.prizeNameLabel.text = _prizeArray[i];
            prizeView.layer.anchorPoint = CGPointMake(0.5, 1.0);
            prizeView.center = CGPointMake(CGRectGetHeight(_bgImageView.frame)/2, CGRectGetHeight(_bgImageView.frame)/2);
            CGFloat angle = M_PI*2/9 * i;
            prizeView.transform = CGAffineTransformMakeRotation(angle);
            [_bgImageView addSubview:prizeView];
        }
    }
    return self;
}

///我的记录
-(void)myRecordAction:(id)sender{
    
    
}

///玩法介绍
-(void)howToPlayAction:(id)sender{
    
    
}

#pragma mark 点击Go按钮
-(void)btnClick{
    
    NSLog(@"点击Go");
    
    //判断是否正在转
    if (_isAnimation) {
        return;
    }
    _isAnimation = YES;
    
    //控制概率[0,90)
    NSInteger lotteryPro = arc4random()%90;
    //设置转圈的圈数
    NSInteger circleNum = 6;
    
    if (lotteryPro < 10) {
        _circleAngle = 0;
    }else if (lotteryPro < 20){
        _circleAngle = 40;
    }else if (lotteryPro < 30){
        _circleAngle = 80;
    }else if (lotteryPro < 40){
        _circleAngle = 120;
    }else if (lotteryPro < 50){
        _circleAngle = 160;
    }else if (lotteryPro < 60){
        _circleAngle = 200;
    }else if (lotteryPro < 70){
        _circleAngle = 240;
    }else if (lotteryPro < 80){
        _circleAngle = 280;
    }else{
        _circleAngle = 320;
    }
    
    CGFloat perAngle = M_PI/180.0;
    
    NSLog(@"turnAngle = %ld",(long)_circleAngle);
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:_circleAngle * perAngle + 360 * perAngle * circleNum];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    
    
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [_bgImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

#pragma mark 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    NSLog(@"动画停止");
    
    _isAnimation = NO;
}

@end
