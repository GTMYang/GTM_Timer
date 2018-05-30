//
//  NSTimer+Weak.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/29.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "NSTimer+Weak.h"

@implementation NSTimer (Weak)

+ (NSTimer *)wk_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:interval target:self selector:@selector(wk_timerHandler:) userInfo:[block copy] repeats:repeats];
}
+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(wk_timerHandler:) userInfo:[block copy] repeats:repeats];
}


+ (void)wk_timerHandler:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
