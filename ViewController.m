//
//  ViewController.m
//  runtime--归档解档
//
//  Created by Hervey on 2017/2/25.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //Ivar runtime里面 Ivar代表成员变量（成员属性）
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Person class], &count);
    //获取其中一个属性名称
    Ivar ivar = ivars[0];
    const char *name = ivar_getName(ivar);
    NSLog(@"成员属性个数:%d。成员属性名是:%s", count,name);
}
- (IBAction)saveData:(id)sender {
    Person *p = [[Person alloc]init];
    p.name = @"hervey";
    p.age = 18;
    p.info = @"http://www.jianshu.com/u/b0bdd6db3cc8";
    //存储沙盒
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"hervey.txt"];
    //归档
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
    NSLog(@"沙盒地址:%@",filePath);
}

- (IBAction)readData:(id)sender {
    //路径
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"hervey.txt"];
    //解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"My name is %@ and age is %d.",p.name, p.age);
    NSLog(@"简书地址:%@",p.info);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
