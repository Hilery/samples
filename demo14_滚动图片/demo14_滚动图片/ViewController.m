//
//  ViewController.m
//  demo14_滚动图片
//
//  Created by polyent on 15/11/11.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.showsHorizontalScrollIndicator=NO;
    
    CGFloat imageW=self.scrollView.frame.size.width;
    CGFloat imageH=self.scrollView.frame.size.height;
    CGFloat imageY=0;
    NSInteger totalCount=5;
    
    for (int i = 0; i < totalCount; i++) {
        CGFloat imageX=i*imageW;
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, 0, imageW, imageH)];
        NSString *name=[NSString stringWithFormat:@"%d.jpg",i+1];
        imageView.image=[UIImage imageNamed:name];
        [self.scrollView addSubview:imageView];
    }
    
    //设置scrollview的滚动范围
    CGFloat contentW=totalCount*imageW;
    //不允许垂直方向上的滚动
    self.scrollView.contentSize=CGSizeMake(contentW, 0);
    //设置分页
    self.scrollView.pagingEnabled=YES;
    
    //监听scrollview的滚动
    self.scrollView.delegate=self;
    self.pageControl.numberOfPages=totalCount;
//    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
//    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self addTimer];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewWidth = scrollView.frame.size.width;
    CGFloat x=scrollView.contentOffset.x;
    int page=(x+scrollViewWidth/2)/scrollViewWidth;
    self.pageControl.currentPage = page;
}


- (void)addTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)nextPage
{
    int page=(int)self.pageControl.currentPage;
    if (page==4) {
        page=0;
    }else
    {
        page++;
    }
    //滚动scrollview
    [UIView beginAnimations:nil context:nil];
    CGFloat x=page*self.scrollView.frame.size.width;
    self.scrollView.contentOffset=CGPointMake(x, 0);
    [UIView setAnimationDuration:0.3];
    [UIView commitAnimations];

}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

-(void)removeTimer
{
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
