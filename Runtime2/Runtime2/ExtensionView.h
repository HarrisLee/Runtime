//
//  ExtensionView.h
//  Runtime2
//
//  Created by JianRongCao on 15/11/12.
//  Copyright © 2015年 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtensionView : UIView

@property (nonatomic, strong) NSString *name;

- (BOOL)hasAttribute:(NSString *)attName;

- (void)showAView;

- (void)replaceAViewToBView;

@end
