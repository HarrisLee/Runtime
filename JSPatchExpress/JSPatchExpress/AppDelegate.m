//
//  AppDelegate.m
//  JSPatchExpress
//
//  Created by JianRongCao on 6/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"
#import "ViewController.h"
#import "JPLoader.h"
#import "JPCGTransform.h"
#import "JPLoader.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//#define TRANSFORM_DEFINE @{ \
//@"name": @"JSPDemo",  \
//@"types": @"FF",    \
//@"keys": @[@"Jsp", @"Demo"]    \
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.开始启动JPEngine 加载JS
    [JPEngine startEngine];
    
    //1).第一种加载JS的方法，但是一般用不到
//    [JPEngine evaluateScript:@"\
//     var alertView = require('UIAlertView').alloc().init();\
//     alertView.setTitle('Alert');\
//     alertView.setMessage('AlertView from js'); \
//     alertView.addButtonWithTitle('OK');\
//     alertView.show(); \
//     "];
    
    //若程序需要用到一些扩展，如结构体,CA，CG 则需要使用extension库里面的文件
    [JPEngine addExtensions:@[@"JPInclude", @"JPCGTransform",@"JPCGGeometry"]];
    
//    [JPEngine defineStruct:TRANSFORM_DEFINE];
    
    [JPEngine defineStruct:@{
                             @"name":@"JSPDemo",
                             @"types":@"FF",
                             @"keys":@[@"Jsp",@"Demo"]}];
    
    NSString *sourcePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Demo.js"];
    NSLog(@"%@",[JPLoader fileMD5:sourcePath]);
    [JPEngine evaluateScriptWithPath:sourcePath];
    
    //获取文件的MD5值
    NSString *sourcePath1 = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample.js"];
    NSLog(@"%@",[JPLoader fileMD5:sourcePath1]);
    
//    main.js里面include其它文件，并未执行的解决方法
//    include必须用到evaluateScriptWithPath， evaluateScript则只能实现单个文件的使用
    //2).第二种加载JS的方法，推荐使用。  可以用这方法来进行模块开发
    [JPEngine evaluateScriptWithPath:sourcePath1];
    
    //3).第三种加载JS的方法
//    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"js"];
//    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
//    [JPEngine evaluateScript:script];
    
    ViewController *vc = [[ViewController alloc] init];
    vc.title = @"JSPatch";
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20.0f],NSFontAttributeName,
                          [UIColor whiteColor],NSForegroundColorAttributeName,nil];
    navi.navigationBar.titleTextAttributes = dict;
    navi.navigationBar.tintColor = [UIColor lightGrayColor];
    navi.navigationBar.barTintColor = [UIColor colorWithRed:0.16 green:0.72 blue:0.98 alpha:1.00];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
