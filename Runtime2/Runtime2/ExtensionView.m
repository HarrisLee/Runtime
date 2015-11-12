//
//  ExtensionView.m
//  Runtime2
//
//  Created by JianRongCao on 15/11/12.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ExtensionView.h"
#import <objc/runtime.h>

@implementation ExtensionView

//3.方法的替换
//*. class_replaceMethod 方法就是动态替换Method的函数,原型 IMP 。
//*. class_replaceMethod(Class cls, SEL name,IMP imp, const char *types) 返回值就是一个新函数的地址（IMP指针）。
//*. 在实际项目中会经常用到这种方式， 比如：iOS 7以及7以下绘制NavigationBar。
- (void)showAView
{
    NSLog(@"show A View");
}

//这种定义无法实现IMP指针转换,必须以C/C++的形式定义方法才可以
//- (void)showBView
//{
//    NSLog(@"show B View");
//}

void showBView(void)
{
    NSLog(@"show B View");
}

/*! 替换showAView方法为showBView*/
- (void)replaceAViewToBView
{
    class_replaceMethod([self class], @selector(showAView), (IMP)showBView, NULL);
}


//2.运行未定义的方法时，增加一个方法，防止程序闪退
/*!  当对象运行某个未定义方法时，则会进入这个方法*/
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    class_addMethod([self class], sel, (IMP)dynamicMethod, "v@:");
    return YES;
}

void dynamicMethod(id self,SEL _cmd)
{
    NSLog(@"%@ don't existent method %@",[self class],NSStringFromSelector(_cmd));
}


//1.判断某个对象是否有某个属性或者变量
/**
 *  判断某个对象是否有某个属性
 *
 *  @param attName 属性名称
 *
 *  @return 是否包含
 */
- (BOOL)hasAttribute:(NSString *)attName
{
    BOOL flag = NO;
    u_int count;
    //class_copyPropertyList只取属性（@property申明的属性）
//    objc_property_t *properties= class_copyPropertyList([self class], &count);
    
    //class_copyIvarList取所有的包括在interface大括号中申明的
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count ; i++)
    {
//        const char *propertyName = property_getName(properties[i]);
//        NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        const char* propertyName = ivar_getName(ivars[i]);
        NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        
        if ([attName isEqualToString:strName]) {
            flag = YES;
        }
        NSLog(@"attribute is %@",strName);
    }
    return flag;
}

@end
