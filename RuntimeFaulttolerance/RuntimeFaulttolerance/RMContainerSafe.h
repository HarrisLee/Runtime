//
//  RMContainerSafe.h
//  RuntimeFaulttolerance
//
//  Created by JianRongCao on 5/20/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMContainerSafe : NSObject

@end


@interface NSMutableDictionary (ContainerSafe)

@end

@interface NSMutableArray (ContainerSafe)

@end