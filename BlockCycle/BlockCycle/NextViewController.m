//
//  NextViewController.m
//  11111111
//
//  Created by JianRongCao on 12/6/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "NextViewController.h"

typedef void(^textBlock)(int);

@interface NextViewController ()

@property (nonatomic,assign) int name;
@property (nonatomic,copy) textBlock blockComp;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.name = 9;
    __weak typeof(self) weakSelf = self;
    self.blockComp = ^(int argument) {
        weakSelf.name = 10;
    };
    
    self.blockComp(self.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
