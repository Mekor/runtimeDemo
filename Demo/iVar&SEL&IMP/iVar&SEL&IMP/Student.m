//
//  Student.m
//  函数指针
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)descriptionSelf {
    NSLog(@"Hello,I am a Student, My studentID %@, %d years old.", [self getStudentID],age);
}


-(NSString *)getStudentID {
    return studentID;
}

-(void)setStudentID:(NSString *)sid {
    studentID = sid;
}
@end
