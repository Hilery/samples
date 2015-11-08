//
//  ViewController.m
//  demo10_ImageViewWithButton
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.tag = 100;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeContactAdd] ;
    btn.frame =  CGRectMake(20, 20, 40, 40);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    //根据tag取出UIImageView*
    UIImageView* view = (UIImageView*)[self.view viewWithTag:100];
    view.backgroundColor = [UIColor blueColor];
    [view addSubview:btn];
}

-(void)click:(UIButton*)btn
{
    NSLog(@"touch me!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
