//
//  JSPatch.h
//  JSPatch
//
//  Created by bang on 15/11/14.
//  Copyright (c) 2015 bang. All rights reserved.
//

#import <Foundation/Foundation.h>

const static NSString *rootUrl = @"http://www.suning.com:8080";

static NSString *publicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuqGjycrqdOTBsvNOyByH9Jv55\nYyLJYdxvf7m5KjuoE1FvC145blT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2h\nWjQ4pnh/j75xCkRTHVe3KdCsmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7Bs\nOD7iDD8Y9j55zj9JkwIDAQAB";

static NSString *privateKey = @"MIICXgIBAAKBgQCuqGjycrqdOTBsvNOyByH9Jv55YyLJYdxvf7m5KjuoE1FvC145\nblT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2hWjQ4pnh/j75xCkRTHVe3KdCs\nmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7BsOD7iDD8Y9j55zj9JkwIDAQAB\nAoGAFwU/f+U7T4nAJjTlOivSgQlotRsp9J0fbtrI4ez9G/Qf4aD/9FXkgWbJ4rfR\nds9ilYaEe6FBQG09j9bzKeTiJfHXh5xxkyJ5T1aPOZ2nsudLgZPONo78R8oItQf0\nrQYbFtVNo+G6rwX4iIZ18zQBLlxM/7hW5mLfeke1VzASFiECQQDVpOb75wfF0gVs\nTgTSwuZ7nduMA4gf4+m/l9sILT8ce4AvjI53a4lDTC/fjx1XboAg9o8TEUEfF8qR\nVPJFPHWLAkEA0UjVR3I/wO0TqMli4odGm7owCqH7IAbOB1oNSgVOv36MTWy8cy//\n84yh2pZirkOZfp499SYUVm0np15UdZdNGQJBAKFa9x0/ou40LeZbkmb/zoWEduFr\ndW7oeo06irHFQooneGvxE1R8QmIyc2G8PCPhkCHVNb/n4zAxjstuxb+m5vsCQQCw\nOTPdxUYJnZdAONMbC+1Yk56AVYSvows5BYrLGU0F0fkx+K12EKTk3zYqaRcOxb0p\n8PUax8W4QJFzTOqxWYWBAkEAhOlTMyotjXMS5V/MdGsBWLxI+CsFiqiGSm1Pa70U\n/crbNELosgoHVYcRYNqIOi6arZaI0dsRAtm+lXLJHHgykw==";


typedef void (^JPUpdateCallback)(NSError *error);

typedef enum {
    JPUpdateErrorUnzipFailed = -1001,
    JPUpdateErrorVerifyFailed = -1002,
} JPUpdateError;

@interface JPLoader : NSObject

/**
 *  运行JSPatch脚本
 *
 *  @return 是否成功运行此脚本
 */
+ (BOOL)run;

/**
 *  升级到此版本App的最新的JSPatch脚本
 *
 *  @param version  最新的JS版本号
 *  @param callback 执行结果
 */
+ (void)updateToVersion:(NSInteger)version callback:(JPUpdateCallback)callback;

+ (void)runTestScriptInBundle;

+ (void)setLogger:(void(^)(NSString *log))logger;

/**
 *  获取当前App版本下的JS版本
 *
 *  @return 返回此App的JS版本号
 */
+ (NSInteger)currentVersion;

/**
 *  获取所有版本的JS脚本根目录即：Library/JSPatch
 *
 *  @return JS路径
 */
+ (NSString *)fetchVersionScriptDirectory;

/**
 *  获取当前文件的MD5值
 *
 *  @param filePath 文件路径
 *
 *  @return 文件的MD5值
 */
+ (NSString *)fileMD5:(NSString *)filePath;

@end