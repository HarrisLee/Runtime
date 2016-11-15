//
//  Person.m
//  KVODemo
//
//  Created by JianRongCao on 8/26/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person.h"


@implementation Person

- (NSInteger)height
{
    NSLog(@"age is %ld,height is %ld",_age,_height);
    return _age + 10;
}

//设置依赖关系，当age的值发生改变时，会引起Height的值变化
+ (NSSet *)keyPathsForValuesAffectingHeight
{
    return [NSSet setWithObject:@"age"];
}

@end
