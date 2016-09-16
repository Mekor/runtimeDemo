//
//  DoProxy.h
//  函数指针
//
//  Created by Mekor on 16/9/5.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import <Foundation/Foundation.h>


#define SET_STUDENT_ID @"setStudentID:"
#define PERSON_CLASS @"Person"
#define SRUDENT_CLASS @"Student"


typedef id (*_IMP)(id, SEL, ...);

@interface DoProxy : NSObject {
    BOOL notFirstRun;
    id person[3];
    SEL say;
    SEL studentid;
    void(*setStudentID_Func) (id, SEL, NSString*);
    _IMP say_Func;
    
    Class studentClass;

}

- (void) doWithPersonId:(id) aPerson studentIDParam:(NSString*) sid;
- (void) setAllIVars;
- (void) SELFuncs;
- (void) functionPointers;

@end
