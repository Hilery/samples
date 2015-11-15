//
//  ViewController.m
//  demo15_autolayout
//
//  Created by polyent on 15/11/12.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat topSpace;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.down addTarget:self action:@selector(pan)];
    topSpace = self.view4ToTop.constant ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pan
{


    if (self.down.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1
//                            options:UIViewAnimationCurveEaseIn
                         animations:^{
                             self.view4ToTop.constant = topSpace+50;
                             [self.view layoutIfNeeded];
                             
                         }
                         completion:^(BOOL complete){
                             if (complete) {
                                 self.view4ToTop.constant = topSpace;

                                  [self.view layoutIfNeeded];
                                 
                             }
                         }];
    }
}

//
//func pan() {
//    if panGesture.state == UIGestureRecognizerState.Ended {
//        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            self.middleView.frame.origin.y = self.middleViewOriginY
//        }, completion: { (success) -> Void in
//            if success {
//                self.middleViewTopSpaceLayout.constant = self.middleViewTopSpaceLayoutConstant
//            }
//        })
//        return
//    }
//    let y = panGesture.translationInView(self.view).y
//    middleViewTopSpaceLayout.constant = middleViewTopSpaceLayoutConstant + y
//}

@end
