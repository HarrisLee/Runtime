//
//  Person.h
//  ClassMethodSwizing
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *name;

+ (void)showName;

- (void)showName;

@end
