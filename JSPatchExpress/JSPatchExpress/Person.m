//
//  Person.m
//  JSPatchExpress
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


@interface Person ()
{
    NSString *school;
}
@end

@implementation Person

- (NSString *)showSchool
{
    return school;
}

- (void)setSchoolName:(NSString *)name
{
    school = name;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    id model = [[[self class] allocWithZone:zone] init];
    id peopleClass = [self class];
    do {
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList(peopleClass, &outCount);
        for (int idx = 0; idx < outCount; idx++) {
            objc_property_t property = properties[idx];
            NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
            id value = [self valueForKey:propName];
            [model setValue:value forKey:propName];
            fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
        }
        
        peopleClass = [peopleClass superclass];
        
    } while (![[peopleClass description] isEqualToString:@"NSObject"]);
    return model;
}

@end
