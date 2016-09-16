//
//  Person.m
//  selfsuper
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/objc-api.h>

@implementation Person
+(void)study {
    NSLog(@"%@ %@ %@ %@",[self class],[self superclass],[super class],[super superclass]);
}

@end
