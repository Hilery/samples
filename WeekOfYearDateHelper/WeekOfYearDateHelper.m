//
//  WeekOfYearDateHelper.m
//  WeekOfYearDateHelper
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "WeekOfYearDateHelper.h"

@implementation WeekOfYearDateHelper


+(NSDate*)getBeginDateFromYearAndWeek:(NSInteger)year withWeek:(NSInteger)week
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponentsForDate = [[NSDateComponents alloc] init];
    if(week==1){
        [dateComponentsForDate setYear:year];
        [dateComponentsForDate setDay:1];
    }else{
        [dateComponentsForDate setYear:year];
        [dateComponentsForDate setWeekday:2];
        [dateComponentsForDate setWeekOfYear:week];
    }
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:dateComponentsForDate];
    return dateFromDateComponentsForDate;
    
}

+(NSDate*)getEndDateFromYearAndWeek:(NSInteger)year withWeek:(NSInteger)week
{
    if (week == [self getWeekNumOfYear:(int)year]) {
        
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *dateComponentsForDate = [[NSDateComponents alloc] init];
        [dateComponentsForDate setYear:year+1];
        [dateComponentsForDate setDay:1];
        NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:dateComponentsForDate];
        NSDate* endDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:dateFromDateComponentsForDate];
        return endDay;
        
    }else{
        NSDate * date = [self getBeginDateFromYearAndWeek:year withWeek:week+1] ;
        NSDate* endDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
        return endDay;
    }
}

+(int)getWeekNumOfYear:(int)year
{
    int dayNum = [self getDayNumOfYear:year];
    //获得第一个周末
    int weekDay = [self getWeekDayOfYearFirstDay:year];
    int left=dayNum -(9-weekDay);
    if (left%7!=0) {
        return (dayNum -(9-weekDay))/7 +2;
    }else{
        return (dayNum -(9-weekDay))/7 +1;
    }
    
}

//获得一年第一天是星期几
+(int)getWeekDayOfYearFirstDay:(int)year{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponentsForDate = [[NSDateComponents alloc] init];
    [dateComponentsForDate setYear:year];
    [dateComponentsForDate setDay:1];
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:dateComponentsForDate];
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:dateFromDateComponentsForDate];
    return (int)[componets weekday];
}

//获得一年有多少天
+(int)getDayNumOfYear:(int) year
{
    if (year%400==0) {
        return 366;
    }else if (year%100==0){
        return 365;
    }else if (year%4==0){
        return 366;
    }else {
        return 365;
    }
    
}
@end
