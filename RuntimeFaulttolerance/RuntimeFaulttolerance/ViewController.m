//
//  ViewController.m
//  RuntimeFaulttolerance
//
//  Created by JianRongCao on 5/20/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "RMContainerSafe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array objectAtIndex:0];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:nil forKey:@"key"];
    
    
    NSMutableString *name = [[NSMutableString alloc] initWithString:@"小妞"];
    name = [NSNull null];
    NSMutableString *name2 = [[NSMutableString alloc] initWithString:@"小妞"];
    [name2 appendString:@""];
    NSLog(@"%@",[name isEqual:name2] ? @"YES":@"NO");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
