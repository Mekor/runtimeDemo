//
//  Dog.m
//  KVOTest
//
//  Created by Mekor on 16/8/31.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"执行了");
}
@end
