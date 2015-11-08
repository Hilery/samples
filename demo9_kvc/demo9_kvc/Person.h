//
//  Person.h
//  demo9_kvc
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject
@property(nonatomic,assign)int age;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)Book* book;
@end
