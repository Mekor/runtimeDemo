//
//                #####################################################
//                #                                                   #
//                #                       _oo0oo_                     #
//                #                      o8888888o                    #
//                #                      88" . "88                    #
//                #                      (| -_- |)                    #
//                #                      0\  =  /0                    #
//                #                    ___/`---'\___                  #
//                #                  .' \\|     |# '.                 #
//                #                 / \\|||  :  |||# \                #
//                #                / _||||| -:- |||||- \              #
//                #               |   | \\\  -  #/ |   |              #
//                #               | \_|  ''\---/''  |_/ |             #
//                #               \  .-\__  '-'  ___/-. /             #
//                #             ___'. .'  /--.--\  `. .'___           #
//                #          ."" '<  `.___\_<|>_/___.' >' "".         #
//                #         | | :  `- \`.;`\ _ /`;.`/ - ` : | |       #
//                #         \  \ `_.   \_ __\ /__ _/   .-` /  /       #
//                #     =====`-.____`.___ \_____/___.-`___.-'=====    #
//                #                       `=---='                     #
//                #     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   #
//                #                                                   #
//                #               佛祖保佑         永无BUG              #
//                #                                                   #
//                #####################################################
//

//  Created by 李小争 on 16/5/18.
//  Copyright © 2016年 WeiZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

//根据类名称获取类
//系统就提供 NSClassFromString(NSString *clsname)

//获取一个类的所有属性名字:类型的名字，具有@property的, 父类的获取不了！
NSDictionary *GetPropertyListOfObject(NSObject *object);
NSDictionary *GetPropertyListOfClass(Class cls);

void Swizzle(Class c, SEL origSEL, SEL newSEL);