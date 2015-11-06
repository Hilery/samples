//
//  AppInfo.h
//  demo7_模型使用
//
//  Created by polyent on 15/11/1.
//  Copyright (c) 2015年 crazysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppInfo : NSObject
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* icon;
@property(nonatomic,strong,readonly)UIImage* image;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appInfoWithDict:(NSDictionary *)dict;
+(NSArray *)appinfoarray;

@end
