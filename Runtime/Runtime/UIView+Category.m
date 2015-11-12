//
//  UIView+Category.m
//  Runtime
//
//  Created by JianRongCao on 15/11/12.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

static const char *identifierKey = "identifier";

@implementation UIView (Category)
@dynamic identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    if (self) {
        self.identifier = @"identifier";
    }
    return self;
}

- (void)setIdentifier:(NSString *)identifier
{
    objc_setAssociatedObject(self, &identifierKey, identifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)identifier
{
    return objc_getAssociatedObject(self, &identifierKey);
}

@end
