//
//  Provider.h
//  NSProxyUse
//
//  Created by 曹建荣 on 2018/5/11.
//  Copyright © 2018 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    ClothesSizeSmall,
    ClothesSizeMiddle,
    ClothesSizeLarge,
} ClothesSize;

// 衣服供应商代理
@protocol ClothProvideProtocol<NSObject>

- (void)purchaseClothWithSize:(ClothesSize)size;

@end

// 图书供应商代理
@protocol BookProviderProtocol<NSObject>

- (void)purchaseBook:(NSString *)title;

@end


@interface Provider : NSObject

@end

// 衣服供应商
@interface ClothesProvider: Provider

@end

// 图书供应商
@interface BookProvider: Provider

@end
