//
//  ViewController.m
//  JKRCrashDemo
//
//  Created by tronsis_ios on 16/10/26.
//  Copyright © 2016年 tronsis_ios. All rights reserved.
//

#import "ViewController.h"
#import "JKRCrash.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *ready = [UIButton new];
    ready.frame = CGRectMake(30, 100, self.view.frame.size.width - 60, 50);
    [ready setTitle:@"准备" forState:UIControlStateNormal];
    [ready setBackgroundColor:[UIColor greenColor]];
    [ready addTarget:self action:@selector(ready) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:ready];
    
    UIButton *crash = [UIButton new];
    crash.frame = CGRectMake(30, 200, self.view.frame.size.width - 60, 50);
    [crash setTitle:@"开始" forState:UIControlStateNormal];
    [crash setBackgroundColor:[UIColor redColor]];
    [crash addTarget:self action:@selector(crash) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:crash];
}

- (void)ready {
    [JKRCrash crashReady];
}

- (void)crash {
    [JKRCrash crashRightNow];
}

@end
