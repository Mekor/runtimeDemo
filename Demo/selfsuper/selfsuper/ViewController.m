//
//  ViewController.m
//  selfsuper
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     * self /super class /superClass
     */
//    [Person study];
//    [Student test];
    
    Student *s = [Student new];
    
    
    /**
     * 动态调用
     */
    // 1. 比如我们要调用 Student中的eat方法, 默认这样写[s eat]; 但是不行,因为我们没有定义.
//    [s eat];
    // 2. 也可以这样调用[s performSelector:@selector(eat)];这样没有问题,@selector中参数是字符串,这个参考swift
//    [s performSelector:@selector(eat)];
    // 3. 使用string创建SEL
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"
    [s performSelector:NSSelectorFromString(@"eat2")];
#pragma clang diagnostic pop
    
    // 上面这样调用会报错,我们在对象调用未实现方法的时候动态的创建一个方法,避免抛出异常.
    
    
    // 测试方法交换
//    [s run];
//    [s sleep];
    
}


///**
// * 测试消息转发
// */
//-(id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"消息转发");
//    NSString *selectorString = NSStringFromSelector(aSelector);
//    if ([selectorString isEqualToString:@"eat2"]){
//        return [RuntimeHelper new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

@end
