//
//  ZYDraggableVCtrl.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/1/9.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "ZYDraggableVCtrl.h"
#import "UIView+ZYDraggable.h"

@interface ZYDraggableVCtrl ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarView;

@end

@implementation ZYDraggableVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.avatarView.userInteractionEnabled = YES;
    
    // Make avatarView draggable
    [self.avatarView makeDraggable];

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
