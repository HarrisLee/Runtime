//
//  UIView+Category.h
//  Runtime
//
//  Created by JianRongCao on 15/11/12.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic, strong) NSString *identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier;

@end
