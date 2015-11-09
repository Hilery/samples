//
//  ViewController.m
//  demo11_frameanimation
//
//  Created by polyent on 15/11/9.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView *view2 ;
@property(nonatomic,strong)UIImageView *view1 ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    self.view1.frame = CGRectMake(20, 100, 50, 50);
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    self. view2.frame = CGRectMake(80, 100, 50, 50);
    [self.view addSubview:self.view2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
  }


- (IBAction)clickBtn:(id)sender {
    NSLog(@"pressed");
    //添加数组
    NSMutableArray *arrayM=[NSMutableArray array];
    for (int i=1; i<35; i++) {
        [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]]];
    }
    //在storyboard加载时已经完成初始化
    [self.imageView setAnimationImages:arrayM];
    [self.imageView setAnimationRepeatCount:1];
    [self.imageView setAnimationDuration:4];
    [self.imageView startAnimating];
    
    //首尾动画
    [UIView beginAnimations:nil context:nil];
    //设置动画时长
    [UIView setAnimationDuration:2.0];
    
    self.view1.bounds = CGRectMake(20, 100, 40, 40);
    
    // commitAnimations,将beginAnimation之后的所有动画提交并生成动画
    [UIView commitAnimations];
    
    
    //block动画
    //简单的动画效果
    [UIView animateWithDuration:2.0 animations:^{
        self.view2.alpha=0;
    } completion:^(BOOL finished) {
        [self.view2 removeFromSuperview];
    }];
}
@end
