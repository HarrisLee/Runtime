//
//  ViewController.m
//  CrashStep
//
//  Created by 曹建荣 on 2018/6/14.
//  Copyright © 2018年 Suning. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *jordan = [[Person alloc] init];
    [jordan performSelectorOnMainThread:@selector(playFootBallInClub:) withObject:@"Byren" waitUntilDone:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
