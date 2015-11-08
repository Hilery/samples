//
//  Person.m
//  demo9_kvc
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString*)description
{
    return [NSString stringWithFormat:@"<%@:%p>,name:%@,age:%d,bookname:%@",[self class],self,self.name,self.age,self.book.bookname];
}
@end
