//
//  NSMutableArray+SafeMethod.m
//  ClassMethodSwizzling
//
//  Created by JianRongCao on 7/13/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "NSMutableArray+SafeMethod.h"
#import <objc/runtime.h>

@implementation NSMutableArray (SafeMethod)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(addObject:) withMethod:@selector(safeAddObject:)];
        [obj swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeObjectAtIndex:)];
        [obj swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safeInsertObject:atIndex:)];
        [obj swizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(safeRemoveObjectAtIndex:)];
        [obj swizzleMethod:@selector(replaceObjectAtIndex:withObject:)
                withMethod:@selector(safeReplaceObjectAtIndex:withObject:)];
    });
}

- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self safeAddObject:anObject];
    }
    else {
        NSLog(@"obj is nil");
    }
}

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index < [self count]) {
        return [self safeObjectAtIndex:index];
    }
    else {
        NSLog(@"index is beyond bounds ");
    }
    return nil;
}

- (void)safeInsertObject:(id)anObject atIndex:(NSInteger)index
{
    if (anObject && index <= [self count]) {
        [self safeInsertObject:anObject atIndex:index];
    }
    else {
        NSLog(@"insert object failed");
    }
}

- (void)safeRemoveObjectAtIndex:(NSInteger)index
{
    if (index < [self count]) {
        [self safeRemoveObjectAtIndex:index];
    }
    else {
        NSLog(@"index beyond bounds");
    }
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < [self count]) {
        [self safeReplaceObjectAtIndex:index withObject:anObject];
    }
    else {
        NSLog(@"replace object failed");
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
