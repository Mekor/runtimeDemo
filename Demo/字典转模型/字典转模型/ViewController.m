//
//  ViewController.m
//  字典转模型
//
//  Created by Mekor on 16/8/31.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Log.h"
#import "Status.h"
#import "NSObject+Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 解析Plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    NSDictionary *statusDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    // 获取字典数组
    NSArray *dictArr = statusDict[@"statuses"];
//    [NSObject resolveDict:dictArr[0]];
    
    
//    [NSObject resolveDict:dictArr[0][@"user"]];
    
    NSMutableArray *statuses = [NSMutableArray array];
    // 遍历字典数组
    for (NSDictionary *dict in dictArr) {
        
        Status *status = [Status modelWithDict:dict];
        
        [statuses addObject:status];
        
    }
    
    // 测试数据
    NSLog(@"%@ %@",statuses,[statuses[0] user]);
}

@end
