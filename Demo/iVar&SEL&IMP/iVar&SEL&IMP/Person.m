
//
//  Person.m
//  函数指针
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)descriptionSelf {
    NSLog(@"Hello, I am a Person, %d years old.", age);
}

-(void)setAge:(int)aAge {
    age = aAge;
}
@end
