//
//  SubView.m
//  Runtime
//
//  Created by JianRongCao on 15/11/25.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "SubView.h"
#import "Masonry.h"



@implementation SubView

- (id)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.sView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak SubView *weakSelf = self;
    [self.sView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(weakSelf);
    }];
}

- (UIScrollView *)sView
{
    if (!_sView) {
        _sView = [[UIScrollView alloc] init];
        for (int i = 0; i < 20; i++) {
            ItemsView *item = [[ItemsView alloc] initWithFrame:CGRectMake(45*i, 0, 40, 150)];
            [_sView addSubview:item];
        }
        [_sView setContentSize:CGSizeMake(1000, 150)];
    }
    return _sView;
}

@end


@implementation ItemsView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end