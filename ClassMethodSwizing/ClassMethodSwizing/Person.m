//
//  Person.m
//  ClassMethodSwizing
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)showName
{
    NSLog(@"orignal Name");
}

- (void)showName
{
    NSLog(@"orignal Name");
}

@end
