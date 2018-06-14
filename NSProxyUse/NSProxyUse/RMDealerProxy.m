//
//  RMDealerProxy.m
//  NSProxyUse
//
//  Created by 曹建荣 on 2018/5/11.
//  Copyright © 2018 Suning. All rights reserved.
//

#import "RMDealerProxy.h"
#import <objc/runtime.h>


@interface RMDealerProxy()

@property (nonatomic, strong) ClothesProvider *clothProvider;

@property (nonatomic, strong) BookProvider *bookProvider;

@property (nonatomic, strong) NSMutableDictionary *methodsMap;

@end

@implementation RMDealerProxy

+ (instancetype)dealerProxy {
    return [[RMDealerProxy alloc] init];
}

- (instancetype)init {
    self.methodsMap = [NSMutableDictionary dictionary];
    self.clothProvider = [[ClothesProvider alloc] init];
    self.bookProvider = [[BookProvider alloc] init];
    
    [self registerMethodsWithTarget:self.bookProvider];
    [self registerMethodsWithTarget:self.clothProvider];
    
    return self;
}

#pragma mark - private method
// 将每一个方法作为Key 保存对应的target. 便于执行时，快速找到执行对象。
- (void)registerMethodsWithTarget:(id)target {
    
    unsigned int numberOfMethods = 0;
    //获取target方法列表
    Method *method_list = class_copyMethodList([target class], &numberOfMethods);
    for (int i = 0; i < numberOfMethods; i ++) {
        //获取方法名并存入字典
        Method temp_method = method_list[i];
        SEL temp_sel = method_getName(temp_method);
        const char *temp_method_name = sel_getName(temp_sel);
        NSString *methodName = [NSString stringWithUTF8String:temp_method_name];
        [self.methodsMap setObject:target forKey:methodName];
    }
    free(method_list);
}

#pragma mark - NSProxy override methods  必须要实现的。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSString *methodName = NSStringFromSelector(sel);
    id target = [self.methodsMap valueForKey:methodName];
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    NSString *methodName = NSStringFromSelector(sel);
    id target = [self.methodsMap valueForKey:methodName];
    if (target && [target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
}

@end
