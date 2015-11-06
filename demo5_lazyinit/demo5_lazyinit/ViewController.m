//
//  ViewController.m
//  demo4-simplepicviewer
//
//  Created by polyent on 15/10/19.
//  Copyright (c) 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

#define POTOIMGW 200
#define POTOIMGH 200
#define POTOIMGX 60
#define POTOIMGY 100

@interface ViewController ()
@property(nonatomic,strong)UILabel* headLabel;
@property(nonatomic,strong)UILabel* descLabel;
@property(nonatomic,strong)UIImageView* image;
@property(nonatomic,strong)UIButton* leftBtn;
@property(nonatomic,strong)UIButton* rightBtn;
@property(nonatomic,assign)int i;
@property (nonatomic,strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化索引
    //    self.i = 0;
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    [self show];
}
-(UIImageView*)image{
    if (_image==nil) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(POTOIMGX, POTOIMGY, POTOIMGW, POTOIMGH)];
        //        _image.image = [UIImage imageNamed:@"01.jpg"];
        [self.view addSubview:_image];
    }
    return _image;
    
    
}
-(UILabel*)headLabel{
    if (_headLabel == nil) {
        _headLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 300, 20)];
        [_headLabel setTextAlignment:NSTextAlignmentCenter];//对齐方式
        [_headLabel setTextColor:[UIColor blueColor]];
        [self.view addSubview:_headLabel];
    }
    return _headLabel;
}

-(UIButton*)leftBtn{
    if (_leftBtn == nil) {
        //左右按钮
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.center.y, 40, 40)];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"left_arrowhighlighted"] forState:UIControlStateHighlighted];
        [_leftBtn addTarget:self action:@selector(leftclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftBtn];
    }
    return _leftBtn;
}

-(UIButton*)rightBtn{
    if (_rightBtn == nil) {
        
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(POTOIMGX+POTOIMGW+10, self.view.center.y, 40, 40)];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"right_arrowhighlighted"] forState:UIControlStateHighlighted];
        [_rightBtn addTarget:self action:@selector(rightclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightBtn];
    }
    return _rightBtn;
}

-(UILabel*)descLabel{
    if (_descLabel == nil) {
        //创建最下边描述图片的lable
        _descLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 450, 300, 30)];
        _descLabel.text = @"第一张";
        [_descLabel setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_descLabel];
    }
    return _descLabel;
}

//向右按键
-(void)rightclick:(UIButton *)btn
{
    self.i++;
    [self show];
}

//向左按键
-(void)leftclick:(UIButton *)btn
{
    self.i--;
    [self show];
}
-(void)show
{
    //根据配置文件展示信息
    self.image.image=[UIImage imageNamed:self.array[self.i][@"name"]];
    self.descLabel.text=self.array[self.i][@"desc"];
    [self.headLabel setText:[NSString stringWithFormat:@"%d/%lu",self.i+1,self.array.count]];
    
    self.leftBtn.enabled=(self.i!=0);
    self.rightBtn.enabled=(self.i!=self.array.count-1);
}
-(NSArray *)array
{
    //懒加载
    if (_array==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
        _array=[[NSArray alloc]initWithContentsOfFile:path];
        NSLog(@"获取数组");
    }
    return _array;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
