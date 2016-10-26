[![preview](https://github.com/Joker-388/iOS10-Bug-Demo/blob/master/Preview/crash.gif)](http://www.sixstr.me)&nbsp;

新的通知框架UserNotification在调试的时候发现一个问题，之前调试代码的时候如果写错了最多时app自己crash，而这个框架会让iOS系统崩溃无限黑屏重启，这里分享一下代码，给位朋友在虚拟机跑跑试一下，无限重启后选择虚拟机reset content and settings就可以恢复。

友情提示：千万别在真机跑，不然真机也会无限重启，而且不能够恢复，因为无限重启的过程手机是无法解锁的，连接不上Xcode和iTunes，不能够通过调试卸载掉错误的app。

需同意app发送通知，等待一分钟后就有了。
