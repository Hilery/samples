//
//  ViewController.h
//  demo15_autolayout
//
//  Created by polyent on 15/11/12.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *middle;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *down;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view4ToTop;

@end

