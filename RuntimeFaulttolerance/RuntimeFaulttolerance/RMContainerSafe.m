//
//  RMContainerSafe.m
//  RuntimeFaulttolerance
//
//  Created by JianRongCao on 5/20/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//
//  主要是通过Runtime实现容错处理。  防止程序奔溃


#import "RMContainerSafe.h"
#import <objc/runtime.h>


@implementation RMContainerSafe

@end

@implementation NSMutableDictionary (ContainerSafe)

+ (void)load
{
    SEL orign = @selector(setObject:forKey:);
    SEL repleace = @selector(setSafeObject:forKey:);
    
    Method orignalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), orign);
    Method replaceMethod = class_getInstanceMethod(self, repleace);
    
    BOOL hasAdd = class_addMethod(NSClassFromString(@"__NSDictionaryM"),
                                  orign,
                                  method_getImplementation(replaceMethod),
                                  method_getTypeEncoding(replaceMethod));
    if (hasAdd) {
        class_replaceMethod(NSClassFromString(@"__NSDictionaryM"),
                            repleace,
                            method_getImplementation(orignalMethod),
                            method_getTypeEncoding(orignalMethod));
    } else {
        method_exchangeImplementations(orignalMethod, replaceMethod);
    }
}

- (void)setSafeObject:(id)obj forKey:(id)key
{
    if (obj == nil) {
        NSLog(@"obj is nil");
    } else {
        [self setSafeObject:obj forKey:key];
    }
}

@end

@implementation NSMutableArray (ContainerSafe)

+ (void)load
{
    SEL orign = @selector(objectAtIndex:);
    SEL replace = @selector(safeObjectAtIndex:);
    
    Method orignalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method replaceMethod = class_getInstanceMethod(self, @selector(safeObjectAtIndex:));
    
    
    BOOL hasAdd = class_addMethod(NSClassFromString(@"__NSArrayM"),
                                  orign,
                                  method_getImplementation(replaceMethod),
                                  method_getTypeEncoding(replaceMethod));
    if(hasAdd){
        class_replaceMethod(NSClassFromString(@"__NSArrayM"),
                            replace,
                            method_getImplementation(orignalMethod),
                            method_getTypeEncoding(orignalMethod));
    } else {
        method_exchangeImplementations(orignalMethod, replaceMethod);
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

@end
