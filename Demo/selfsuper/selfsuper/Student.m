//
//  Student.m
//  selfsuper
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Student.h"
#import "ObjcRuntime.h"
#import <objc/message.h>
@interface RuntimeHelper : NSObject
-(void)eat2;
@end

@implementation RuntimeHelper

-(void)eat2{
    NSLog(@"%s %@, %p", __FUNCTION__,self, _cmd);
}

@end

@implementation Student
// void(*)()
// 默认方法都有两个隐式参数，
void eat(id self,SEL sel)
{
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
// 刚好可以用来判断，未实现的方法是不是我们想要动态添加的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"eat")) {
        // 动态添加eat方法
        
        // 第一个参数：给哪个类添加方法
        // 第二个参数：添加方法的方法编号
        // 第三个参数：添加方法的函数实现（函数地址）
        // 第四个参数：函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, NSSelectorFromString(@"eat"), (IMP)eat, "v@:");
        
    }
    
    return [super resolveInstanceMethod:sel];
}


///**
// * 测试消息转发
// */
//-(id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"消息转发");
//    NSString *selectorString = NSStringFromSelector(aSelector);
//    if ([selectorString isEqualToString:@"eat2"]){
//        // 将消息转给 RuntimeHelper 对象,让他来处理
//        return [RuntimeHelper new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}



/**
 *  完整的消息转发
 */

/* 必须重写 (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
 * 消息转发机制使用从这个方法中获取的信息来创建NSInvocation对象。因此我们必须重写这个方法，为给定的selector提供一个合适的方法签名。
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (!signature) {
        if ([RuntimeHelper instancesRespondToSelector:aSelector]) {
            signature = [RuntimeHelper instanceMethodSignatureForSelector:aSelector];
        }
    }
    
    return signature;
}

-(void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([RuntimeHelper instanceMethodSignatureForSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[RuntimeHelper new]];
    }
}




+(void)study {
//    NSLog(@"%@ %@ %@ %@",[self class],[self superclass],[super class],[super superclass]);
    
    [super study];
}

+(void)test {
    NSLog(@"%@-----%@",self,NSStringFromSelector(_cmd));
}


-(void)run {
    NSLog(@"跑🏃");
}

-(void)sleep {
    NSLog(@"睡觉😴");
}

+(void)load {
    Swizzle(self, @selector(run), @selector(sleep));
}

@end
