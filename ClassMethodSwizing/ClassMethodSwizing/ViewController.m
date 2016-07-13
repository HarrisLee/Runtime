//
//  ViewController.m
//  ClassMethodSwizing
//
//  Created by JianRongCao on 7/7/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [Person showName];
    
    [[Person new] performSelector:@selector(showName)];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array objectAtIndex:1];
    [array insertObject:@"你好" atIndex:0];
    NSLog(@"%@",array);
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"value1" forKey:@"key1"];
    NSLog(@"%@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
