//
//  ViewController.m
//  NSProxyUse
//
//  Created by 曹建荣 on 2018/5/11.
//  Copyright © 2018 Suning. All rights reserved.
//

#import "ViewController.h"
#import "RMDealerProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RMDealerProxy *proxy = [RMDealerProxy dealerProxy];
    [proxy purchaseBook:@"鲁冰逊漂流记"];
    [proxy purchaseClothWithSize:ClothesSizeLarge];
    [proxy purchaseClothWithSize:ClothesSizeMiddle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
