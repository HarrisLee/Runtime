//
//  Provider.m
//  NSProxyUse
//
//  Created by 曹建荣 on 2018/5/11.
//  Copyright © 2018 Suning. All rights reserved.
//

#import "Provider.h"

@implementation Provider

@end


@implementation ClothesProvider

- (void)purchaseClothWithSize:(ClothesSize)size {
    switch (size) {
        case ClothesSizeLarge:
            NSLog(@"You have choose Large Clothes");
            break;
        case ClothesSizeMiddle:
            NSLog(@"You have choose Middle Clothes");
            break;
        default:
            NSLog(@"You have choose Small Clothes");
            break;
    }
}

@end


@implementation BookProvider

- (void)purchaseBook:(NSString *)title {
    NSLog(@"please bring the book: %@",title);
}

@end

