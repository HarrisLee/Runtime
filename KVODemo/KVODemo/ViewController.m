//
//  ViewController.m
//  KVODemo
//
//  Created by JianRongCao on 8/26/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "Person.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    - (id)valueForKeyPath:(NSString *)keyPath方法不是很了解。 其实这个方法非常的强大
//    NSArray *array = @[@"name", @"w", @"aa", @"jimsa"];
//    NSLog(@"%@", [array valueForKeyPath:@"uppercaseString"]);
//    输出：
//    (
//     NAME,
//     W,
//     AA,
//     JIMSA
//     )
//    相当于数组中的每个成员执行了uppercaseString方法，然后把返回的对象组成一个新数组返回。既然可以用uppercaseString方法，那么NSString的其他方法也可以，比如
//    
//    [array valueForKeyPath:@"length"]
//    返回每个字符串长度的组成的数组。只要你能想到的成员实例方法都可以这么用。
    
    
//    对NSNumber数组快速计算数组求和、平均数、最大值、最小值
//    NSArray *array = @[@1, @2, @3, @4, @10];
//    
//    NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
//    NSNumber *avg = [array valueForKeyPath:@"@avg.self"];
//    NSNumber *max = [array valueForKeyPath:@"@max.self"];
//    NSNumber *min = [array valueForKeyPath:@"@min.self"];
//    或者指定输出类型
//    
//    NSNumber *sum = [array valueForKeyPath:@"@sum.floatValue"];
//    NSNumber *avg = [array valueForKeyPath:@"@avg.floatValue"];
//    NSNumber *max = [array valueForKeyPath:@"@max.floatValue"];
//    NSNumber *min = [array valueForKeyPath:@"@min.floatValue"];
//    去除重复的数据
//    
//    NSArray *array = @[@"name", @"w", @"aa", @"jimsa", @"aa"];
//    NSLog(@"%@", [array valueForKeyPath:@"@distinctUnionOfObjects.self"]);
//    打印
//    (
//     name,
//     w,
//     jimsa,
//     aa
//     )
//    
//    
//    
//    对NSDictionary数组快速找出相应key对的值
//    NSArray *array = @[@{@"name" : @"cookeee",@"code" : @1},
//                       @{@"name": @"jim",@"code" : @2},
//                       @{@"name": @"jim",@"code" : @1},
//                       @{@"name": @"jbos",@"code" : @1}];
//    NSLog(@"%@", [array valueForKeyPath:@"name"]);
//    直接得到字典中namekey对应的值组成的数组，显然比循环取值再加入到新数组中方便快捷
//    
//    (
//     cookeee,
//     jim,
//     jim,
//     jbos
//     )
//    同样可以嵌套使用，先剔除name对应值的重复数据再取值
//    
//    NSArray *array = @[@{@"name" : @"cookeee",@"code" : @1},
//                       @{@"name": @"jim",@"code" : @2},
//                       @{@"name": @"jim",@"code" : @1},
//                       @{@"name": @"jbos",@"code" : @1}];
//    
//    NSLog(@"%@", [array valueForKeyPath:@"@distinctUnionOfObjects.name"]);
//    打印
//    (
//     cookeee,
//     jim,
//     jbos
//     )
    
    
    
    
    NSDictionary *dict1 = @{@"dic1":@{@"dic2":@{@"name":@"lisi",@"info":@{@"age":@"12"}}}};
    NSString *name = [dict1 valueForKeyPath:@"dic1.dic2.name"];
    NSString *name1 = [dict1 valueForKeyPath:@"dic1.dic2.name1"];
    NSLog(@"%@-%@",name,name1);
    
    NSArray *array = @[@4,@84,@6,@9];
    NSMutableArray *persons = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        Person *person = [[Person alloc] init];
        person.age = rand()%100;
        [persons addObject:person];
    }
    
    NSLog(@"%@",[array valueForKeyPath:@"@max.self"]);
    NSLog(@"%@",[persons valueForKeyPath:@"@max.age"]);
    
    NSString *html = @"压缩包解压,文件夹拖放到你的工程的根目录下与XXXX.xcworkspace同级即可<font color=\"red\" size=5>注意,只是修改,</font><img src=\"http://cdn-qn0.jianshu.io/assets/app-page/download-app-qrcode-053849fa25f9b44573ef8dd3c118a20f.png\" alt=\"Download app qrcode\" />";
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 64, 255, 100)];
    label.attributedText = string;
    label.numberOfLines = 0;
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (NSSet *)keyPathsForValuesAffectingName
{
    return [NSSet setWithObject:@"name"];
}

@end
