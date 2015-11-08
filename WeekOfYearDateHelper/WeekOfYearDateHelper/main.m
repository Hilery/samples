//
//  main.m
//  WeekOfYearDateHelper
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeekOfYearDateHelper.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int year = 2015;
        for (int i=1; i<54; i++) {
            NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSLog(@"%@",[formatter stringFromDate:[WeekOfYearDateHelper getBeginDateFromYearAndWeek:year withWeek:i]]);
            NSLog(@"%@",[formatter stringFromDate:[WeekOfYearDateHelper getEndDateFromYearAndWeek:year withWeek:i]]);
        }
        
    }
    return 0;
}
