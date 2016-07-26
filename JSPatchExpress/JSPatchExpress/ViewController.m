//
//  ViewController.m
//  JSPatchExpress
//
//  Created by JianRongCao on 6/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "Masonry.h"
#import "BBRSACryptor.h"
#import "GTMBase64.h"

#define kRegisterRSAPublicKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuqGjycrqdOTBsvNOyByH9Jv55YyLJYdxvf7m5KjuoE1FvC145blT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2hWjQ4pnh/j75xCkRTHVe3KdCsmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7BsOD7iDD8Y9j55zj9JkwIDAQAB"


#define kRegisterRSAPrivateKey  @"MIICXgIBAAKBgQCuqGjycrqdOTBsvNOyByH9Jv55YyLJYdxvf7m5KjuoE1FvC145blT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2hWjQ4pnh/j75xCkRTHVe3KdCsmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7BsOD7iDD8Y9j55zj9JkwIDAQABAoGAFwU/f+U7T4nAJjTlOivSgQlotRsp9J0fbtrI4ez9G/Qf4aD/9FXkgWbJ4rfRds9ilYaEe6FBQG09j9bzKeTiJfHXh5xxkyJ5T1aPOZ2nsudLgZPONo78R8oItQf0rQYbFtVNo+G6rwX4iIZ18zQBLlxM/7hW5mLfeke1VzASFiECQQDVpOb75wfF0gVsTgTSwuZ7nduMA4gf4+m/l9sILT8ce4AvjI53a4lDTC/fjx1XboAg9o8TEUEfF8qRVPJFPHWLAkEA0UjVR3I/wO0TqMli4odGm7owCqH7IAbOB1oNSgVOv36MTWy8cy//84yh2pZirkOZfp499SYUVm0np15UdZdNGQJBAKFa9x0/ou40LeZbkmb/zoWEduFrdW7oeo06irHFQooneGvxE1R8QmIyc2G8PCPhkCHVNb/n4zAxjstuxb+m5vsCQQCwOTPdxUYJnZdAONMbC+1Yk56AVYSvows5BYrLGU0F0fkx+K12EKTk3zYqaRcOxb0p8PUax8W4QJFzTOqxWYWBAkEAhOlTMyotjXMS5V/MdGsBWLxI+CsFiqiGSm1Pa70U/crbNELosgoHVYcRYNqIOi6arZaI0dsRAtm+lXLJHHgykw=="

@interface ViewController ()
{
    NSArray *dataArray;
}
@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"appear   %@",self);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"disappear   %@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击我" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.0 weight:1.0];
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    __weak ViewController *slf = self;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(slf.view.mas_top).offset(200);
        make.left.equalTo(slf.view.mas_left).offset(50);
        make.width.height.equalTo(@100);
    }];
    
    //    NSURL *url = [NSURL URLWithString:@"http://free2.macx.cn:8281/tools/photo/BalsamiqMockups342.dmg"];
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //    NSURLSession *session = [NSURLSession sharedSession];
    //    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //
    //    }];
    //    [task resume];
    
    //    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    //    //这样获取到得网络类型是手机的开启网络，而不是当前连接类型，可以结合Reachability类来实现，获取手机当前连接的的网络类型
    //    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //    [[NSNotificationCenter defaultCenter] addObserverForName:CTRadioAccessTechnologyDidChangeNotification object:nil queue:queue usingBlock:^(NSNotification *note) {
    //        NSLog(@"%@",note);
    //    }];
    //    NSLog(@"Initial cell connection: %@", networkInfo.currentRadioAccessTechnology);
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        NSLog(@"下载");
    //        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //        NSLog(@"%@",data);
    //    });
    
    
    Person *p1 = [[Person alloc] init];
    p1.name = @"小萌";
    //    [p1 sayMessage:@"hello jspatch!"];
    Person *p11 = [[Person alloc] init];
    p11.name = @"校门11";
    void (^showNameBlock)(NSString *name) = ^(NSString *name){
        NSLog(@"%p  ----   %p   %@",p1,p1.name,p1.name);
    };
    
//    p1 = [p11 copy];
    
    p1.name = @"小萌1";
    showNameBlock(@"1");
    p1.name = @"小萌2";
    showNameBlock(@"1");
    
    
    // Create NSData object
    NSData *nsdata = [@"iOS Developer Tips encoded in Base64" dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get NSString from NSData object in Base64
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    
    // Print the Base64 encoded string
    NSLog(@"Encoded: %@", base64Encoded);
    
    // Let's go the other way...
    // NSData from the Base64 encoded str
    NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    
    // Decoded NSString from the NSData
    NSString *base64Decoded = [[NSString alloc] initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
    NSLog(@"Decoded: %@", base64Decoded);
    
    NSString *mainString = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"js"];
    NSError *error = nil;
    NSString *rsaMain = [NSString stringWithContentsOfFile:mainString encoding:NSUTF8StringEncoding error:&error];
    rsaMain = @"你好，江苏！";
    //加密，设置公钥
    BBRSACryptor *cryptor = [[BBRSACryptor alloc] init];
    [cryptor importRSAPublicKeyBase64:kRegisterRSAPublicKey];
    NSData *data = [cryptor encryptWithPublicKeyUsingPadding:RSA_PKCS1_PADDING
                                                   plainData:[rsaMain dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *rasEncryptString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"rsa string is %@",rasEncryptString);
    
    //加密，设置私钥
    [cryptor importRSAPrivateKeyBase64:kRegisterRSAPrivateKey];
    NSData *encryptData = [[NSData alloc] initWithBase64EncodedString:rasEncryptString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData *rasEncry = [cryptor decryptWithPrivateKeyUsingPadding:RSA_PKCS1_PADDING cipherData:encryptData];
    NSString *decryptString = [[NSString alloc] initWithData:rasEncry encoding:NSUTF8StringEncoding];
    NSLog(@"%@",decryptString);
    [self sayHssss:@"1111"];
    

    NSData *dat = [[NSData alloc] initWithData:[@"18fe34999620" dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@",[dat description]);
    Byte *byte = (Byte *)[dat bytes];
    NSLog(@"%@",[NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x",byte[1],byte[2],byte[3],byte[4],byte[5],byte[0]]);
    NSLog(@"%@",[NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x",byte[1],byte[2],byte[3],byte[4],byte[5],byte[0]]);
}

- (void)sayHssss:(NSString *)name
{
    [name hash];
    //    NSParameterAssert([name isKindOfClass:[NSString class]]);
    NSLog(@"NSParameterAssert");
}

+ (NSMutableDictionary *)dict
{
    return [[NSMutableDictionary alloc] init];
}

+ (NSMutableArray *)dataMutableArray
{
    return [[NSMutableArray alloc] init];
}

- (void)tapMe:(UIButton *)sender
{
    [sender removeFromSuperview];
    [ViewController showAppName:^(NSString *name, NSString *version) {
        NSLog(@"%@------%@",name,version);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"add button");
        [self.view addSubview:sender];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    unsigned int count;
    Ivar *properties = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = properties[i];
        NSLog(@"%@",[[NSString alloc] initWithUTF8String:ivar_getName(ivar)]);
    }
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:YES];
    NSLog(@"%@",dataArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)showAppName:(void (^)(NSString *name,NSString *version))complition
{
    NSString *nameString = @"JSPatch";
    NSString *verString = @"2.2.4";
    NSLog(@"%@-%@",@"JSPatch",@"2.2");
    complition(nameString,verString);
}

typedef void (^showNameBundle)(NSString *bundle);
+ (showNameBundle)showGoodName
{
    showNameBundle bundle = ^(NSString *name){
        NSLog(@"bundle  %@",name);
    };
    return bundle;
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"alertView willdismiss");
}

@end
