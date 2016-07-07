//
//  Person+Proxy.m
//  ClassMethodSwizing
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person+Proxy.h"
#import <objc/runtime.h>

@implementation Person (Proxy)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL orign = @selector(showName);
        SEL change = @selector(proxy_showName);
        
        Method oMethod = class_getClassMethod([self class], orign);
        Method cMethod = class_getClassMethod([self class], change);
        
        //因为class_addMethod 这个添加方法最终还是会添加到实例方法上面，而不会添加到类方法上面，所以如果需要替换类方法，
        //可以直接使用method_exchangeImplementations(oMethod, cMethod);    而不需要使用下面的判断保护。
        BOOL hasAdded = class_addMethod([self class],
                                        orign,
                                        method_getImplementation(cMethod),
                                        method_getTypeEncoding(cMethod));
        if (hasAdded) {
            class_replaceMethod([Person class],
                                change,
                                method_getImplementation(oMethod),
                                method_getTypeEncoding(oMethod));
        } else {
        if (cMethod == nil) {
            NSLog(@"method is nil");
            return ;
        }
            method_exchangeImplementations(oMethod, cMethod);
        }
    });
}

+ (void)proxy_showName
{
    NSLog(@"proxy_showName");
}

@end
