//
//  ViewController.h
//  JSPatchExpress
//
//  Created by JianRongCao on 6/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

//1.第一种定义结构体方法  支持JSPatch，且名称为JSPDemo
//struct JSPDemo{
//    CGFloat Jsp;
//    CGFloat Demo;
//};
//typedef struct JSPDemo JSPDemo;

//2.第二种定义结构体方法  支持JSPatch,且名称为JSPDemo
typedef struct JSPDemo{
    CGFloat Jsp;
    CGFloat Demo;
}JSP1Demo;

//3.第3种定义结构体方法  不支持JSPatch
//typedef struct{
//    CGFloat Jsp;
//    CGFloat Demo;
//}JSP1Demo;


@interface ViewController : UIViewController 

@property (nonatomic,strong) NSMutableArray *ase;

void showHello(NSString *msg);

- (JSP1Demo)passS:(JSP1Demo)s;

- (void)showArray:(NSMutableArray *)array;

@end

