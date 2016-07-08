//
//  Person.h
//  JSPatchExpress
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>

@property (nonatomic,strong) NSString *name;

- (NSString *)sayMessage:(NSString *)message;

@end
