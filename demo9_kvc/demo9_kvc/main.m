//
//  main.m
//  demo9_kvc
//
//  Created by polyent on 15/11/8.
//  Copyright © 2015年 crazysun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //        Person* person = [[Person alloc] init];
        //        person.name = @"crazysun";
        //        person.age = 28;
        //        NSLog(@"%@",person);
        
        Person* person = [[Person alloc] init];
        [person setValue:@"crazysun" forKey:@"name"];
        [person setValue:@"28" forKey:@"age"];
        Book* book1 = [[Book alloc] init];
        [book1 setValue:@"effective c++" forKey:@"bookname"];
        [person setValue:book1 forKey:@"book"];
        
        NSLog(@"%@",person);
        
        Person* person2 = [[Person alloc] init];
        [person2 setValue:@"crazysun2" forKey:@"name"];
        [person2 setValue:@"29" forKey:@"age"];
        Book* book2 = [[Book alloc] init];
        [book2 setValue:@"effective java" forKey:@"bookname"];
        [person2 setValue:book2 forKey:@"book"];
        NSLog(@"%@",person2);
        
        NSArray* array = @[person,person2];
        //        说明：用KVC取一个嵌套层次很深的路径的时候，只要诶它一个路径就能把想要的属性给拿出来。（.可以理解为路径。一直一直进入）。能够帮助我们很方便的编码
        //使用NSArray可以列表形势很方便取出属性
        
        NSLog(@"%@",[array valueForKeyPath:@"book.bookname"]);
    }
    return 0;
}
