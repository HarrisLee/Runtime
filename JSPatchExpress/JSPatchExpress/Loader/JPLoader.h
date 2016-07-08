//
//  JSPatch.h
//  JSPatch
//
//  Created by bang on 15/11/14.
//  Copyright (c) 2015 bang. All rights reserved.
//

#import <Foundation/Foundation.h>

const static NSString *rootUrl = @"";
static NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuqGjycrqdOTBsvNOyByH9Jv55\nYyLJYdxvf7m5KjuoE1FvC145blT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2h\nWjQ4pnh/j75xCkRTHVe3KdCsmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7Bs\nOD7iDD8Y9j55zj9JkwIDAQAB\n-----END PUBLIC KEY-----";

static NSString *privateKey = @"-----BEGIN RSA PRIVATE KEY-----\nMIICXgIBAAKBgQCuqGjycrqdOTBsvNOyByH9Jv55YyLJYdxvf7m5KjuoE1FvC145\nblT5/hUG/EVtYkGzkgyCzsUxF7V3c0Gj5CSaOG2hWjQ4pnh/j75xCkRTHVe3KdCs\nmTTzWxU03LWx66DPvri4X/wdLdMGc0UkU1rNQ7BsOD7iDD8Y9j55zj9JkwIDAQAB\nAoGAFwU/f+U7T4nAJjTlOivSgQlotRsp9J0fbtrI4ez9G/Qf4aD/9FXkgWbJ4rfR\nds9ilYaEe6FBQG09j9bzKeTiJfHXh5xxkyJ5T1aPOZ2nsudLgZPONo78R8oItQf0\nrQYbFtVNo+G6rwX4iIZ18zQBLlxM/7hW5mLfeke1VzASFiECQQDVpOb75wfF0gVs\nTgTSwuZ7nduMA4gf4+m/l9sILT8ce4AvjI53a4lDTC/fjx1XboAg9o8TEUEfF8qR\nVPJFPHWLAkEA0UjVR3I/wO0TqMli4odGm7owCqH7IAbOB1oNSgVOv36MTWy8cy//\n84yh2pZirkOZfp499SYUVm0np15UdZdNGQJBAKFa9x0/ou40LeZbkmb/zoWEduFr\ndW7oeo06irHFQooneGvxE1R8QmIyc2G8PCPhkCHVNb/n4zAxjstuxb+m5vsCQQCw\nOTPdxUYJnZdAONMbC+1Yk56AVYSvows5BYrLGU0F0fkx+K12EKTk3zYqaRcOxb0p\n8PUax8W4QJFzTOqxWYWBAkEAhOlTMyotjXMS5V/MdGsBWLxI+CsFiqiGSm1Pa70U\n/crbNELosgoHVYcRYNqIOi6arZaI0dsRAtm+lXLJHHgykw==\n-----END RSA PRIVATE KEY-----";

typedef void (^JPUpdateCallback)(NSError *error);

typedef enum {
    JPUpdateErrorUnzipFailed = -1001,
    JPUpdateErrorVerifyFailed = -1002,
} JPUpdateError;

@interface JPLoader : NSObject
+ (BOOL)run;
+ (void)updateToVersion:(NSInteger)version callback:(JPUpdateCallback)callback;
+ (void)runTestScriptInBundle;
+ (void)setLogger:(void(^)(NSString *log))logger;
+ (NSInteger)currentVersion;
+ (NSString *)fileMD5:(NSString *)filePath;
@end