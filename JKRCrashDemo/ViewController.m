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
    
    [JKRCrash crash];
}

@end
