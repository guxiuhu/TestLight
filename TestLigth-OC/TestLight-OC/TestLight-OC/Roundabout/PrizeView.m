//
//  PrizeView.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/6/15.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "PrizeView.h"
#import <Masonry/Masonry.h>

@interface PrizeView()

@end

@implementation PrizeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //名字
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setFont:[UIFont systemFontOfSize:8]];
        [nameLabel setText:@"测试"];
        [nameLabel setTextAlignment:NSTextAlignmentCenter];
        [nameLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(8);
            make.top.equalTo(self.mas_top).with.offset(4);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
        }];
        self.prizeNameLabel = nameLabel;

        //图片

    }
    return self;
}

@end
