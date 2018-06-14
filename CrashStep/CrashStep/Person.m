//
//  Person.m
//  CrashStep
//
//  Created by 曹建荣 on 2018/6/14.
//  Copyright © 2018年 Suning. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "NBAPlayer.h"
#import "FootballPlayer.h"

@interface Person()
{
    NBAPlayer *player;
    FootballPlayer *footballPlayer;
}

@end

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        player = [[NBAPlayer alloc] init];
        footballPlayer = [[FootballPlayer alloc] init];
    }
    return self;
}

void dynamicMethodIMP(id self, SEL _cmd,id param) {
    NSLog(@" >> This gay's best like sport is :%@",param);
}

//当一个实例执行一个不存在的方法的时候，会经历三步，如果最终未能找到具体的执行，才会出现崩溃
//第一步:首先在此方法中判断是否有可执行的方法，有则返回YES,否则返回NO.
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
    if (sel == NSSelectorFromString(@"playSport:")) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//第二步：当第一步找不到可以执行的方法的时候，会进入此方法，在此方法中，寻找可以执行的实例并返回。
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([player respondsToSelector:aSelector]) {
        return player;
    }
    return [super forwardingTargetForSelector:aSelector];
}

//第三步：当第二步也无法找到具体的执行类的时候，进入此方法。
//runtime发送methodSignatureForSelector:消息获取Selector对应的方法签名。返回值非空则通过forwardInvocation:转发消息，
//返回值为空则向当前对象发送doesNotRecognizeSelector:消息
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if ( signature == nil ) {
        if ([footballPlayer respondsToSelector:aSelector]) {
            signature = [footballPlayer methodSignatureForSelector:aSelector];
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL seletor = [anInvocation selector];
    if ([footballPlayer respondsToSelector:seletor]) {
        [anInvocation invokeWithTarget:footballPlayer];
    }
}

@end
