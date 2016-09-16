//
//  DoProxy.m
//  函数指针
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "DoProxy.h"
#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>

@implementation DoProxy

-(void)setAllIVars {
    person[0] = [Person new];
    
    studentClass = NSClassFromString(SRUDENT_CLASS);
    person[1] = [studentClass new];
    person[2] = [studentClass new];
    
    say = @selector(descriptionSelf);
    studentid = NSSelectorFromString(SET_STUDENT_ID);
}

-(void)SELFuncs {
    [self doWithPersonId:person[0] studentIDParam:@"1990"];
    [self doWithPersonId:person[1] studentIDParam:@"2000"];
    [self doWithPersonId:person[2] studentIDParam:@"2016"];
    [self doWithPersonId:self studentIDParam:@"12312312"];
}

-(void)functionPointers {
    setStudentID_Func = (void (*)(id, SEL, NSString*)) [person[1] methodForSelector:studentid];
    say_Func = (_IMP)[person[1] methodForSelector:say];
    
    
    setStudentID_Func(person[1],studentid,@"10086");
    NSLog(@"Running as a function pointer");
    say_Func(person[1],say);
}

-(void)doWithPersonId:(id)aPerson studentIDParam:(NSString *)sid {
    if(notFirstRun == NO) {
        NSString *myName = NSStringFromSelector(_cmd);
        NSLog(@"Running in the method of %@", myName);
        notFirstRun = YES;
    }
    NSString *personClassName = [aPerson className];
    if ([personClassName isEqualToString:PERSON_CLASS] || [personClassName isEqualToString:SRUDENT_CLASS]) {
        [aPerson setAge:22];
        
        if ([aPerson respondsToSelector:studentid]) {
            [aPerson performSelector:studentid withObject:sid];
        }else {
            NSLog(@"Hi, I am not a student, I do not have sid");
        }
        
        [aPerson performSelector:say];
    }else {
        NSString *yourClassName = [aPerson className];
        NSLog(@"Hi, you are a %@, but I like person or student!", yourClassName);
    }
}

@end
