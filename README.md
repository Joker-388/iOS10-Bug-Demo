iOS10-Bug-Demo
==============
[![preview](https://github.com/Joker-388/iOS10-Bug-Demo/blob/master/Preview/crash1.gif)](http://www.sixstr.me)&nbsp;
[![preview](https://travis-ci.org/Joker-388/MessageImageCategory.svg?branch=master)](http://www.sixstr.me)&nbsp;
<br><br>
新的通知框架UserNotification在调试的时候发现一个问题，之前调试代码的时候如果写错了最多时app自己crash，而这个框架会让iOS系统崩溃无限黑屏重启，这里分享一下Demo，给位朋友在虚拟机跑跑试一下，无限重启后选择虚拟机reset content and settings就可以恢复。

友情提示：千万别在真机跑，不然真机也会无限重启，而且不能够恢复，因为无限重启的过程手机是无法解锁的，连接不上Xcode和iTunes，不能够通过调试卸载掉错误的app。

觉得好玩顺手点一个star，前期说谢谢啦。
==============

<br/>
---
使用方法：
==============
1.点击准备按钮，同意app发送通知。<br>
2.点击开始按钮，app崩溃，设备无限黑屏重启。<br>

<br/>
---
English
==============
1.Click ready button, allow app authorization.<br>
2.Click start button, app clash, and device restart again and again.<br>
<br/>
---
Core Code
==============
```objective-c
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @2;
    content.body = @"body";
    content.sound = [UNNotificationSound defaultSound];
    content.subtitle = @"subtitle";
    content.title = @"title";
    
    NSDate *date = [NSDate new];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"HH"];
    NSInteger currentHour=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"mm"];
    NSInteger currentMinute=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"ss"];
    NSInteger currentSecond=[[formatter stringFromDate:date] integerValue];
    
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
```
