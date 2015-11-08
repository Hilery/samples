//
//  WeekOfYearDateHelper.h
//  WeekOfYearDateHelper
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekOfYearDateHelper : NSObject
//获得一年第几周的开始日期
+(NSDate*)getBeginDateFromYearAndWeek:(NSInteger)year withWeek:(NSInteger)week;
//获得一年第几周的结束日期
+(NSDate*)getEndDateFromYearAndWeek:(NSInteger)year withWeek:(NSInteger)week;
//获得一年共有多少周
+(int)getWeekNumOfYear:(int)year;
@end
