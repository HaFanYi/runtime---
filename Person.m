//
//  Person.m
//  runtime--归档解档
//
//  Created by Hervey on 2017/2/25.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>
@implementation Person

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    //获取属性列表
    Ivar *ivars = class_copyIvarList([Person class], &count);
    for(int i= 0; i < count; i++) {
        //取出对应的成员属性
        Ivar ivar = ivars[i];
        //获取属性名称
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}

//解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档
            id value = [aDecoder decodeObjectForKey:key];
            //为成员属性赋值
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end
