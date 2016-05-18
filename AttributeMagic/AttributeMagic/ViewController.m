//
//  ViewController.m
//  AttributeMagic
//
//  Created by JianRongCao on 5/16/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"


/*! objc_runtime_name  用于 @interface 或 @protocol，将类或协议的名字在编译时指定成另一个：*/
__attribute__((objc_runtime_name("SarkGay")))
@interface Srak : NSObject

/*! objc_requires_super   提示需要调用父类的方法*/
- (void)hailHydra __attribute__((objc_requires_super));

@end

@implementation Srak

- (void)hailHydra
{
    NSLog(@"father hialhydra");
}

@end


/*! objc_subclassing_restricted 代表不可以被继承*/
__attribute__((objc_subclassing_restricted))
@interface SrakSon : Srak

@end

@implementation SrakSon

- (void)hailHydra
{
    
}

@end


//@interface SrakSons : SrakSon
//
//@end
//
//@implementation SrakSons
//
//@end


@interface ViewController ()

@end

@implementation ViewController

/*! objc_boxable 可以将struct 类型或是 union 类型成 NSValue 对象*/
typedef struct __attribute__((objc_boxable)) {
    CGFloat x, y, width, height;
} XXRect;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    XXRect rect = {1,2,3,4};
    NSValue *value = @(rect);
    
    
//    printValueAge(900);
    

    logAnything(@[@"1", @"2"]);
    logAnything(233);
    logAnything(CGRectMake(1, 2, 3, 4));
    
    
    
    __strong NSString *string __attribute__((cleanup(stringCleanup))) = @"suning";
    __strong Srak *srak __attribute__((cleanup(modelCleanup))) = [[Srak alloc] init];
    {
        // 加了个`unused`的attribute用来消除`unused variable`的warning
        __strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^{
            NSLog(@"I'm dying...");
        };
    } // 这里输出"I'm dying..."
    
    
    NSLog(@"my class name is %@", NSStringFromClass([Srak class])); // "SarkGay"
    
}

/*! enable_if 这个属性只能用在 C 函数上，可以用来实现参数的静态检查：*/
static void printValueAge(int age) __attribute__((enable_if(age > 0 && age < 130, "你是火星人么？")))
{
    NSLog(@"age is %d",age);
}


/*! overloadable  用于 C 函数，可以定义若干个函数名相同，但参数不同的方法，调用时编译器会自动根据参数选择函数原型：*/
__attribute__((overloadable)) void logAnything(id obj) {
    NSLog(@"%@", obj);
}
__attribute__((overloadable)) void logAnything(int number) {
    NSLog(@"%@", @(number));
}
__attribute__((overloadable)) void logAnything(CGRect rect) {
    NSLog(@"%@", NSStringFromCGRect(rect));
}


static void stringCleanup(__strong NSString **string) {
    NSLog(@"string cleanup");
}

static void modelCleanup(__strong Srak **sark) {
    NSLog(@"sark cleanup");
}

// void(^block)(void)的指针是void(^*block)(void)
static void blockCleanUp(__strong void(^*block)(void)) {
    NSLog(@"block cleanup");
    (*block)();
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
