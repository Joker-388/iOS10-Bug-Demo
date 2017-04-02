//
//  JKRCrash.m
//  JKRCrashDemo
//
//  Created by Lucky on 2017/4/2.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "JKRCrash.h"

@interface JKRCrash ()<UNUserNotificationCenterDelegate>

@end

@implementation JKRCrash

+ (void)crashReady {
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:[JKRCrash new]];
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];
}

+ (void)crashRightNow {
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @2;
    content.body = @"body";
    content.sound = [UNNotificationSound defaultSound];
    content.subtitle = @"subtitle";	content.title = @"title";
    NSDate *date = [NSDate new];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear = [[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth = [[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay = [[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"HH"];
    NSInteger currentHour = [[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"mm"];
    NSInteger currentMinute = [[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"ss"];
    NSInteger currentSecond = [[formatter stringFromDate:date] integerValue];
    
    if (currentSecond + 2 > 59) {
        currentMinute = currentMinute + 1;
        currentSecond = 0;
    } else {
        currentSecond = currentSecond + 2;
    }
    
    NSDateComponents *components = [NSDateComponents new];
    components.year = currentYear;
    components.month = currentMonth;
    components.day = currentDay;
    components.hour = currentHour;
    components.minute = currentMinute;
    components.second = currentSecond;
    
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"" content:content trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        exit(0);		
    }];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
}

@end
