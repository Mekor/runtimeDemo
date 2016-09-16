//
//  main.m
//  KVOTest
//
//  Created by Mekor on 16/8/31.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import <objc/runtime.h>
#import "ClassTest.h"


///使用Objective-C runtime函数遍历class，获得方法列表
static NSArray* classMethodList(Class c)
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:5];
    unsigned int count = 0;
    Method* methodList = class_copyMethodList(c, &count);
    for(int i = 0; i < count; ++i)
        {
            SEL sel = method_getName(*(methodList+i));
            [array addObject:NSStringFromSelector(sel)];
        }
    free(methodList);
    return array;
}

///打印对象的所有信息，包括函数class信息和运行时动态class信息
static void printDescription(NSString* name, id obj)
{
    NSString* string = [NSString stringWithFormat:@"%@:%@\n\tclass %@\n\tobjclass %@\n\timplementmethod %@\n",
                        name,
                        obj,
                        [obj class],
                        object_getClass(obj),
                        ///object_getClass(obj)和obj->isa是等价的
                        [classMethodList(object_getClass(obj)) componentsJoinedByString:@" , "]];
    printf("%s", [string UTF8String]);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Person *person = [[Person alloc]init];
//        Dog *dog = [[Dog alloc]init];
//        [person addObserver:dog forKeyPath:@"age" options:0 context:nil];
//        person.age = @"12";
        
        
        
        ClassTest* x = [[ClassTest alloc] init];
        ClassTest* y = [[ClassTest alloc] init];
        ClassTest* xy = [[ClassTest alloc] init];
        ClassTest* control = [[ClassTest alloc] init];
        
        [x addObserver:x forKeyPath:@"x" options:NSKeyValueObservingOptionNew context:nil];
        [y addObserver:y forKeyPath:@"y" options:NSKeyValueObservingOptionNew context:nil];
        [xy addObserver:xy forKeyPath:@"x" options:NSKeyValueObservingOptionNew context:nil];
        [xy addObserver:xy forKeyPath:@"y" options:NSKeyValueObservingOptionNew context:nil];
        
        printDescription(@"x", x);
        printDescription(@"y", y);
        printDescription(@"xy", xy);
        printDescription(@"control", control);
        
        printf("Using NSObject method, normal setX is %p, overrite setX is %p\n", [control methodForSelector:@selector(setX:)], [x methodForSelector:@selector(setX:)]);
        printf("Using libobjc method, normal setX is %p, overrite setX is %p\n\n\n\n",
               class_getMethodImplementation(object_getClass(control), @selector(setX:)),
               class_getMethodImplementation(object_getClass(x), @selector(setX:)));
        
        return 0;
    }
    return 0;
}

