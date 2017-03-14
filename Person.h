//
//  Person.h
//  runtime--归档解档
//
//  Created by Hervey on 2017/2/25.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, strong)NSString *name;
@property (nonatomic)int age;
@property (nonatomic, strong)NSString *sex;
@property (nonatomic, strong)NSString *info;



@end
