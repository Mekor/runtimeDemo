//
//  Student.h
//  函数指针
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "Person.h"

@interface Student : Person {
    NSString *studentID;
}
-(void)descriptionSelf;
-(NSString *)getStudentID;
-(void)setStudentID:(NSString *)sid;
@end
