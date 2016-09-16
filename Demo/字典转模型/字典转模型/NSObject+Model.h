//
//  NSObject+Model.h
//  字典转模型
//
//  Created by Mekor on 16/8/31.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ModelDelegate <NSObject>

@optional
// 提供一个协议，只要准备这个协议的类，都能把数组中的字典转模型
+ (NSDictionary *)arrayContainModelClass;

@end


@interface NSObject (Model)
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
