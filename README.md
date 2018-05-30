

GTM_Timer
===================
iOS各种timer的封装，解决保留环内存泄漏的问题

# 简介

- 支持用block创建各类Timer（NSTimer, GCD timer, CADisplayLink）
- 解决了Timer的保留环造成的内存泄漏的问题


# 使用例子
直接下载代码，代码里面有使用实例


# 安装

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `GTM_Timer in your `Podfile`.

```ruby
use_frameworks!

pod 'GTM_Timer'
```

Then, run the following command.

```bash
$ pod install
```


## 直接引入源码

将`GTM_Timer` 代码拖到你的项目目录（记得勾选Copy）

# 当前版本

 Vesrion 0.0.2

# 使用帮助


```objc
@interface TimerTestViewController () {
    NSTimer *_nstimer;
    dispatch_source_t _gcdtimer;
    CADisplayLink *_displayLink;
}

@end

@implementation TimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) weakSelf = self;
    _nstimer = [GTM_TimerFactory nstimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf doTimer];
    }];
    _gcdtimer = [GTM_TimerFactory gcdTimerWithTimeInterval:1 block:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf doTimer];
        });
    }];
    _displayLink = [GTM_TimerFactory displayLinkWithTimeInterval:1 block:^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf doTimer];
    }] ;
    
}

- (void)doTimer {
    static NSInteger i =0;
    NSLog(@"----> %@ 执行了 %zi 次", self.timerTypeName, ++i);
}



- (void)dealloc
{
    [_nstimer invalidate];
    dispatch_cancel(_gcdtimer);
    [_displayLink invalidate];
    NSLog(@"TimerTestViewController dealloc...");
}


@end

```



#参与开源
欢迎提交 issue 和 PR，大门永远向所有人敞开。

#开源协议
本项目遵循 MIT 协议开源，具体请查看根目录下的 [LICENSE](https://raw.githubusercontent.com/GTMYang/GTMRefresh/master/LICENSE) 文件。


