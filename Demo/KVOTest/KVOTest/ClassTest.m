//
//  ClassTest.m
//  KVOTest
//
//  Created by Mekor on 16/9/6.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "ClassTest.h"

@implementation ClassTest
@synthesize x, y,z;

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"x"])
        {
            NSObject* new = [change objectForKey:@"new"];
            NSLog(@"new x is %@", new);
        }
    else
        {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }  
}
@end
