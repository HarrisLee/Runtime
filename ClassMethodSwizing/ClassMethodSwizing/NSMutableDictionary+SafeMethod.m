//
//  NSMutableDictionary+SafeMethod.m
//  ClassMethodSwizzling
//
//  Created by JianRongCao on 7/13/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "NSMutableDictionary+SafeMethod.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (SafeMethod)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(safeSetObject:forKey:)];
    });
}

- (void)safeSetObject:(id)anObject forKey:(id)key
{
    if (anObject && key) {
        [self safeSetObject:anObject forKey:key];
    }
    else {
        NSLog(@"object or key is nil");
    }
}

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
