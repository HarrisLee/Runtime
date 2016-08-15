//
//  ViewController.h
//  JSPatchExpress
//
//  Created by JianRongCao on 6/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

//struct JSPDemo{
//    CGFloat Jsp;
//    CGFloat Demo;
//};
//typedef struct JSPDemo JSPDemo;

typedef struct JSPDemo{
    CGFloat Jsp;
    CGFloat Demo;
}JSP1Demo;

//typedef struct{
//    CGFloat Jsp;
//    CGFloat Demo;
//}JSP1Demo;


@interface ViewController : UIViewController 

@property (nonatomic,strong) NSMutableArray *ase;

void showHello(NSString *msg);

- (JSP1Demo)passS:(JSP1Demo)s;

- (void)showArray:(NSMutableArray *)array;

@end

