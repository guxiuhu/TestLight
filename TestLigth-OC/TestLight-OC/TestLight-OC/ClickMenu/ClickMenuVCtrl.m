//
//  ClickMenuVCtrl.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/4/24.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "ClickMenuVCtrl.h"

@interface ClickMenuVCtrl ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation ClickMenuVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.containerView = [UIView new];
    [self.containerView setBackgroundColor:[UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:.30]];
    self.containerView.clipsToBounds = YES;
    self.containerView.layer.cornerRadius = 10;
    [self.view addSubview:self.containerView];
    [self.containerView setFrame:CGRectMake(100, 100, 100, 20)];
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.containerView addSubview:clickBtn];
    [clickBtn setFrame:CGRectMake(0, 0, 100, 20)];
    [clickBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickAction:(UIButton*)btn{
    
    if (btn.isSelected) {
        [btn setSelected:NO];
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.containerView setFrame:CGRectMake(100, 100, 100, 20)];
        }];
    } else {
        
        [btn setSelected:YES];

        [UIView animateWithDuration:0.3 animations:^{
            [self.containerView setFrame:CGRectMake(100, 100, 100, 200)];
        }];
    }
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
