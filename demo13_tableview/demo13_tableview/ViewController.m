//
//  ViewController.m
//  demo13_tableview
//
//  Created by polyent on 15/11/9.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"
@interface ViewController () <UITableViewDataSource>
@property(weak,nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *carGroups;
@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.carGroups count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((CarGroup *)(self.carGroups[section])).cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
     UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    CarGroup *g = self.carGroups[indexPath.section];
    // 2.2取出对应行的数据
    NSString *name = g.cars[indexPath.row];
    // 2.3设置cell要显示的数据
    cell.textLabel.text = name;
    // 3.返回要显示的控件
    return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarGroup *g = self.carGroups[section];
    NSString *title = g.title;
    return title;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        // 1.创建模型
        CarGroup *cg1 = [[CarGroup alloc] init];
        cg1.title = @"德系品牌";
        cg1.desc = @"高端大气上档次";
        cg1.cars = @[@"奥迪", @"宝马"];
        
        CarGroup *cg2 = [[CarGroup alloc] init];
        cg2.title = @"日韩品牌";
        cg2.desc = @"还不错";
        cg2.cars = @[@"本田", @"丰田", @"小田田"];
        
        CarGroup *cg3 = [[CarGroup alloc] init];
        cg3.title = @"欧美品牌";
        cg3.desc = @"价格昂贵";
        cg3.cars = @[@"劳斯莱斯", @"布加迪", @"小米"];
        
        CarGroup *cg4 = [[CarGroup alloc] init];
        cg4.title = @"欧美品牌";
        cg4.desc = @"价格昂贵";
        cg4.cars = @[@"劳莱斯", @"布迪", @"小米饭"];
        
        CarGroup *cg5 = [[CarGroup alloc] init];
        cg5.title = @"欧美品牌";
        cg5.desc = @"价格昂贵";
        cg5.cars = @[@"斯莱斯", @"加迪", @"小米粥"];
        // 2.将模型添加到数组中
        _carGroups = @[cg1, cg2, cg3,cg4,cg5];
    }
    // 3.返回数组
    return _carGroups;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
//        CarGroup *g = self.carGroups[indexPath.section];
//        if ([g.cars count] == 1) {
//            NSArray* array = self.carGroups;
//            NSMutableArray* muArray = array;
//            [muArray removeObjectAtIndex:indexPath.section];
//        }
//        else
//        {
//            NSMutableArray* muArray =  g.cars;
//            [muArray removeObjectAtIndex:indexPath.row];
//        }
//        
//        NSLog(@"deleted");
//        [_tableView reloadData];

    }
   }

@end
