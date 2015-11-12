//
//  ViewController.m
//  Runtime2
//
//  Created by JianRongCao on 15/11/12.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "ExtensionView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    ExtensionView *extension = [[ExtensionView alloc] init];
    [extension hasAttribute:@"view"];
    
    [extension performSelector:@selector(show) withObject:nil];
    [extension replaceAViewToBView];
    [extension showAView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
