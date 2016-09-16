//
//  main.m
//  iVar&SEL&IMP
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#import "DoProxy.h"



int max(int x, int y)
{
    return x > y ? x : y;
}


//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
////        DoProxy *doProxy = [DoProxy new];
////        
////        [doProxy setAllIVars];
////        [doProxy SELFuncs];
////        [doProxy functionPointers];
//    }
//    
//    
//    
//    // 函数指针的简单应用.
//    /* p 是函数指针 */
//    int (* p)(int,int) = &max;
//    int a,b,c,d;
//    
//    printf("please input 3 numbers:");
//    scanf("%d %d %d",&a,&b,&c);
//    
//    /* 与直接调用函数等价，d = max(max(a, b), c) */
//    d = p(p(a, b), c);
//    
//    printf("the maxumum number is: %d\n", d);
//    
//    return 0;
//}


struct object
{
    int data;
};

int object_compare(struct object * a,struct object * z)
{
    return a->data < z->data ? 1 : 0;
}

struct object *maximum(struct object * begin,struct object * end,int (* compare)(struct object *, struct object *))
{
    struct object * result = begin;
    while(begin != end)
        {
        if(compare(result, begin))
            {
            result = begin;
            }
        ++ begin;
        }
    return result;
}

int main(void)
{
    struct object data[8] = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}};
    struct object * max;
    max = maximum(data + 0, data + 8, & object_compare);
    return 0;
}
