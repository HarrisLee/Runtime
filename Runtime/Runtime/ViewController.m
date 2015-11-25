//
//  ViewController.m
//  Runtime
//
//  Created by JianRongCao on 15/11/3.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"
#import "UIView+Category.h"
#import "SubView.h"

@interface ViewController ()
{
    NSString    *documentPath;
    NSBundle    *imageBundle;
    UIImageView *imageView;
}
@property (nonatomic, strong) SubView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.18 green:0.79 blue:0.92 alpha:1];
    
    float width = [UIScreen mainScreen].bounds.size.width;
//    float imageWidth = 300;
//    documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    imageBundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/%@",documentPath,@"file.bundle"]];
//    
//    imageView = [[UIImageView alloc] init];
//    [imageView setImage:[UIImage imageWithContentsOfFile:[imageBundle pathForResource:@"2@2x" ofType:@"png"]]];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.backgroundColor = [UIColor lightGrayColor];
//
//    imageView.frame = CGRectMake((width - imageWidth)/2.0,
//                                 100,
//                                 imageWidth,
//                                 imageWidth*imageView.image.size.height/imageView.image.size.width);
// 
//    [self.view addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.equalTo(self.view);
//    }];
    self.subView.backgroundColor = [UIColor purpleColor];
    
    UIProgressView *progress = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 300, width - 100, 10)];
    progress.progress = 0.5;
    progress.tintColor = [UIColor whiteColor];      //效果等同于progressTintColor 属性
    progress.progressTintColor = [UIColor redColor];
    progress.trackTintColor = [UIColor yellowColor];
    [self.view addSubview:progress];
    
    //NSMutableSet 的 anyObject 获取的是随机的一个对象， 也可能是固定的（当里面的值为多个时）
    NSMutableSet *set = [[NSMutableSet alloc] init];
    [set addObject:@{@"name":@"3"}];
    [set addObject:@{@"name":@"1"}];
    [set addObject:@{@"name":@"2"}];
    [set addObject:@{@"name":@"6"}];
    [set addObject:@{@"name":@"5"}];
    [set addObject:@{@"name":@"4"}];
    [set addObject:@{@"name":@"0"}];
    [set addObject:@{@"name":@"7"}];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];  //根据name属性进行升序排序
    NSLog(@"%@",[set sortedArrayUsingDescriptors:@[sort]]);   //添加排序规则
    NSLog(@"%@",[set anyObject]);

    NSDictionary *dic = @{@"1":@"1value",@"2":@"1value",@"3":@"1value"};
    NSLog(@"%@  --  %@ -- %@",[dic allValues],[dic allKeys],[dic allKeysForObject:@"1value"]);
    
    imageView.identifier = @"111sss";
    NSLog(@"%@",imageView.identifier);
    
    [self.view bringSubviewToFront:progress];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    __weak ViewController *weakSelf = self;
    [self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view.mas_top).offset(400);
    }];
}

- (SubView *)subView
{
    if (!_subView) {
        _subView = [[SubView alloc] init];
        [self.view addSubview:_subView];
    }
    return _subView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%@",NSStringFromCGPoint([[touches anyObject] locationInView:self.view]));
    NSLog(@"%@",[[touches anyObject] view]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
