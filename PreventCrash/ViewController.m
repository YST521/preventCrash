//
//  ViewController.m
//  PreventCrash
//
//  Created by youxin on 2018/2/7.
//  Copyright © 2018年 YST. All rights reserved.
//

#import "ViewController.h"
#import "AvoidCrash.h"
//#import "NSMutableDictionary+AvoidCrash.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    
//    [AvoidCrash makeAllEffective];
  
//     [NSMutableDictionary avoidCrashExchangeMethod];
    
    
    NSArray *arr = @[@"00"];


   
    NSMutableDictionary *dic = @{
                                  @"name" : @"chenfanfang",
                                  @"age" : @(25)
                                  
                                  }.mutableCopy;
    NSString *key = nil;
    [dic removeObjectForKey:key];
  
    
    NSString *str = @"123";
    
      NSLog(@"*666********%@--%@--%@",arr[2],dic,[str substringFromIndex:5]);
    
    NSArray *aa = nil;
    NSLog(@"#######---%@",aa[1]);
    
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.view.backgroundColor = [UIColor greenColor];

    //数组越界
    NSArray *aa = @[@"1"];
    NSLog(@"%@",aa[100]);
    //添加空元素
    NSMutableArray *bb = [NSMutableArray array];
    [bb addObject:nil];
    
    //空字典取值
    NSDictionary *dic = @{@"aa":@"123"};
    NSDictionary *dic1 = nil;
    NSDictionary *dic2 =  @{@"aa":@""};
    NSLog(@"%@---%@",dic[@"aa"],dic1[@"a"],dic2[@"aa"]);
    
    //字典添加空值
//    NSMutableDictionary *DD = [NSMutableDictionary dictionary];
//    [DD setObject:nil forKey:@"DD"];
    
    //字符串截取 越界
    NSString *str = @"123";
    NSLog(@"str: %@--%@--%@",[str substringFromIndex:100],[str substringToIndex:20]);
    
    
    
}

- (void)dealwithCrashMessage:(NSNotification *)note {
    //不论在哪个线程中导致的crash，这里都是在主线程
    
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    //详细讲解请查看 https://github.com/chenfanfang/AvoidCrash
    
    NSLog(@"yyyy----%@",note.userInfo);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
