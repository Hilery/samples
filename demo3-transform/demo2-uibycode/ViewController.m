//
//  ViewController.m
//  demo2-uibycode
//
//  Created by polyent on 15/10/18.
//  Copyright (c) 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
typedef enum{
    btnTagTop = 1,
    btnTagDown,
    btnTagLeft,
    btnTagRight,
    
}btnTag;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hello");
    UIButton * headImageView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    headImageView.frame = CGRectMake(100, 100, 100, 100);
    
    //普通状态下按钮属性
    [headImageView setBackgroundImage:[UIImage imageNamed:@"demo"] forState:UIControlStateNormal];
    [headImageView setTitle:@"click me" forState:UIControlStateNormal];
    [headImageView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    //高亮状态下按钮属性
    [headImageView setBackgroundImage:[UIImage imageNamed:@"demo"] forState:UIControlStateHighlighted];
    [headImageView setTitle:@"clicked" forState:UIControlStateHighlighted];
    [headImageView setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    //添加事件
    
    [self.view addSubview:headImageView];
    self.headImageView = headImageView;
    
    //添加四个按钮
    UIButton * topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topBtn.frame = CGRectMake(100, 250, 40, 40);
    [topBtn setBackgroundImage:[UIImage imageNamed:@"up_arrow"] forState:UIControlStateNormal];
    [topBtn setBackgroundImage:[UIImage imageNamed:@"up_arrowhighlight"] forState:UIControlStateHighlighted];
    [topBtn setTag:1];
    [topBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
    
    UIButton * downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downBtn.frame = CGRectMake(100, 350, 40, 40);
    [downBtn setBackgroundImage:[UIImage imageNamed:@"down_arrow"] forState:UIControlStateNormal];
    [downBtn setBackgroundImage:[UIImage imageNamed:@"down_arrowhighlight"] forState:UIControlStateHighlighted];
    [downBtn setTag:2];
    [downBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downBtn];
    
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(50, 300, 40, 40);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"left_arrowhighlight"] forState:UIControlStateHighlighted];
    [leftBtn setTag:3];
    [leftBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(150, 300, 40, 40);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"right_arrowhighlight"] forState:UIControlStateHighlighted];
    [rightBtn setTag:4];
    [rightBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    
    //放大缩小
    UIButton* plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    plusBtn.frame = CGRectMake(250, 250, 40, 40);
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"plushighlight"] forState:UIControlStateHighlighted];
    [plusBtn setTag:0];
    [plusBtn addTarget:self action:@selector(zoom:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plusBtn];
    
    UIButton* minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    minusBtn.frame = CGRectMake(250, 350, 40, 40);
    [minusBtn setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
    [minusBtn setBackgroundImage:[UIImage imageNamed:@"minus_highlight"] forState:UIControlStateHighlighted];
    [minusBtn setTag:1];
    [minusBtn addTarget:self action:@selector(zoom:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:minusBtn];
    
    
    //旋转按钮
    UIButton* rotateLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rotateLeftBtn.frame = CGRectMake(200, 400, 40, 40);
    [rotateLeftBtn setBackgroundImage:[UIImage imageNamed:@"left_rotate"] forState:UIControlStateNormal];
    [rotateLeftBtn setBackgroundImage:[UIImage imageNamed:@"left_rotatehighlight"] forState:UIControlStateHighlighted];
    [rotateLeftBtn setTag:1];
    [rotateLeftBtn addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rotateLeftBtn];
    
    
    UIButton* rotateRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rotateRightBtn.frame = CGRectMake(300, 400, 40, 40);
    [rotateRightBtn setBackgroundImage:[UIImage imageNamed:@"right_rotate"] forState:UIControlStateNormal];
    [rotateRightBtn setBackgroundImage:[UIImage imageNamed:@"right_rotatehighlight"] forState:UIControlStateHighlighted];
    [rotateRightBtn setTag:0];
    [rotateRightBtn addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rotateRightBtn];
    
    
}
- (void)zoom:(UIButton*) btn{
    CGRect rect = self.headImageView.bounds;
    if (btn.tag) {
        //zoom in
        rect.size.width     -= 50;
        rect.size.height    -= 50;
    }else{
        rect.size.width     += 50;
        rect.size.height    += 50;
        
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    self.headImageView.bounds = rect;
    [UIView commitAnimations];
    
}

- (void)rotate:(UIButton*) btn{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    if (btn.tag) {
        self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, -M_1_PI);
    }else{
        self.headImageView.transform = CGAffineTransformRotate(self.headImageView.transform, M_1_PI);
    }
     [UIView commitAnimations];
    
}

- (void)clicked:(UIButton*) btn{
    NSLog(@"Clicked,%i",(int)btn.tag);
    
    /**注意，这里如果控制位置的两个属性frame和center同时使用的话，会出现很好玩的效果，注意分析*/
    //练习使用center属性
    CGPoint center=self.headImageView.center;
    switch (btn.tag) {
        case btnTagTop:
            center.y-=30;
            break;
        case btnTagDown:
            center.y+=30;
            break;
        case btnTagLeft:
            center.x-=50;
            break;
        case btnTagRight:
            center.x+=50;
            break;
    }
    
    //首尾式设置动画效果
    [UIView beginAnimations:nil context:nil];
    self.headImageView.center=center;
    //设置时间
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
    NSLog(@"移动!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
