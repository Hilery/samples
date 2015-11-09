//
//  ViewController.m
//  demo12_scrollview
//
//  Created by polyent on 15/11/9.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView* _scrollView;
    UIImageView* _imageview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.frame;
//    scrollView.frame = CGRectMake(0, 0, 200, 200);
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    
    _imageview=[[UIImageView alloc]init];
    _imageview.image=[UIImage imageNamed:@"big.jpg"];
    CGFloat imgW=_imageview.image.size.width;
    CGFloat imgH=_imageview.image.size.height;
    _imageview.frame=CGRectMake(0, 0, imgW, imgH);
    [scrollView addSubview:_imageview];
    scrollView.contentSize=_imageview.image.size;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    
    scrollView.contentOffset=CGPointMake(850, 300);
    scrollView.contentInset=UIEdgeInsetsMake(20, 20, 20, 20);
    
    _scrollView=scrollView;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2.0;
    
    _scrollView.delegate = self;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
