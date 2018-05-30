//
//  TimerTestViewController.m
//  GTM_TimerExample
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TimerTestViewController.h"
#import "GTM_TimerFactory.h"

@interface TimerTestViewController () {
    NSTimer *_nstimer;
    dispatch_source_t _gcdtimer;
    CADisplayLink *_displayLink;
}
@property (nonatomic, readonly) NSString *timerTypeName;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation TimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    switch (_timerType) {
        case ETimerTypeNSTimer: {
            _nstimer = [GTM_TimerFactory nstimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf doTimer];
            }];
        }
            break;
        case ETimerTypeGCD: {
            _gcdtimer = [GTM_TimerFactory gcdTimerWithTimeInterval:1 block:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    __strong typeof(self) strongSelf = weakSelf;
                    [strongSelf doTimer];
                });
            }];
        }
            break;
        case ETimerTypeDisplayLink: {
            _displayLink = [GTM_TimerFactory displayLinkWithTimeInterval:1 block:^{
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf doTimer];
            }] ;
        }
            break;
    }
}

- (void)doTimer {
    static NSInteger i =0;
    NSLog(@"----> %@ 执行了 %zi 次", self.timerTypeName, ++i);
    _countLabel.text = [NSString stringWithFormat:@"%zi s", i];
}



- (void)dealloc
{
    switch (_timerType) {
        case ETimerTypeNSTimer:
            [_nstimer invalidate];
            break;
        case ETimerTypeGCD:
            dispatch_cancel(_gcdtimer);
            break;
        case ETimerTypeDisplayLink:
            [_displayLink invalidate];
            break;
    }
    NSLog(@"TimerTestViewController dealloc...");
}

- (NSString *)timerTypeName {
    switch (_timerType) {
        case ETimerTypeNSTimer:
            return @"_nstimer";
        case ETimerTypeGCD:
            return @"_gcdtimer";
        case ETimerTypeDisplayLink:
            return @"_displayLink";
    }
}


@end
