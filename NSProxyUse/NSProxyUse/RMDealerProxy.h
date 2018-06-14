//
//  RMDealerProxy.h
//  NSProxyUse
//
//  Created by 曹建荣 on 2018/5/11.
//  Copyright © 2018 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Provider.h"

// 此类就是经销商，我们跟他买东西，他去和供应商买东西，然后卖给我们。
@interface RMDealerProxy : NSProxy<BookProviderProtocol,ClothProvideProtocol>

+ (instancetype)dealerProxy;

@end
