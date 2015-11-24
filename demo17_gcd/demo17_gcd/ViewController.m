//
//  ViewController.m
//  demo17_gcd
//
//  Created by polyent on 15/11/18.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test1];
    [self test2];
//    [self test3];
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    
    //子线程开启新线程 再回到主线程 通用做法
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        NSURL * url = [NSURL URLWithString:@"http://www.jlonline.com/uploads/151118/9-15111Q40HU22.jpg"];
        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        NSLog(@"excute here 1 %i",__LINE__);
        
        //回到主线程中展示 可以加快执行速度
        dispatch_async(dispatch_get_main_queue(), ^{
             view.image = image;
        });
       
    });
    
    NSLog(@"excute here 2");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test1
{
    NSLog(@"%@",[NSThread currentThread]);
    //创建串行线程
    dispatch_queue_t queue = dispatch_queue_create("test1", NULL);
    //异步 不阻塞
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    //同步 阻塞
    dispatch_sync(queue, ^{
        NSLog(@"---%@",[NSThread currentThread]);
    });
}

//并发线程
-(void)test2
{
    //dispatch_apply 代替for循环 size_t来标识当前循环迭代 从0 到 count-1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    size_t count = 10;
    dispatch_apply(count, queue , ^(size_t i){
        printf("%zd",i);
    });
}

//同步主循环
-(void)test3
{
    dispatch_queue_t queue = dispatch_get_main_queue();
    //同步阻塞
    dispatch_sync(queue, ^{
        NSLog(@"---%@",[NSThread currentThread]);
    });
}
@end
