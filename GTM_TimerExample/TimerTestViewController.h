//
//  TimerTestViewController.h
//  GTM_TimerExample
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ETimerTypeNSTimer = 0,
    ETimerTypeDisplayLink = 1,
    ETimerTypeGCD = 2
} ETimerType;

@interface TimerTestViewController : UIViewController
@property (nonatomic, assign) ETimerType timerType;

@end
