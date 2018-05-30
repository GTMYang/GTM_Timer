//
//  GTM_TimerFactory.m
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSTimer+Weak.h"
#import "WeakWrapper.h"
#import "GTM_TimerFactory.h"
#import "CADisplayLink+Block.h"

@implementation GTM_TimerFactory


+ (NSTimer *)nstimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)(NSTimer *timer))block {
    NSTimer *_timer1 = [NSTimer wk_timerWithTimeInterval:interval repeats:repeats block:block];
    [[NSRunLoop mainRunLoop] addTimer:_timer1 forMode:NSRunLoopCommonModes];
    return _timer1;
}

//+ (CADisplayLink *)displayLinkWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)sel {
//    WeakWrapper *wapper = [[WeakWrapper alloc] initWith:target];
//    CADisplayLink *_displayLink = [CADisplayLink displayLinkWithTarget:wapper selector:sel];
//    _displayLink.frameInterval = 60*interval;
//    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//
//    return _displayLink;
//}

+ (CADisplayLink *)displayLinkWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block {
    BlockWrapper * wapBlock = [BlockWrapper new];
    wapBlock.block = block;
    WeakWrapper *wapper = [[WeakWrapper alloc] initWithWillWeakObj:wapBlock];
    CADisplayLink *_displayLink = [CADisplayLink displayLinkWithTarget:wapper selector:@selector(excuteBlock)];
    _displayLink.blockWrap = wapBlock;
    _displayLink.frameInterval = 60*interval;
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    return _displayLink;
}

+ (dispatch_source_t)gcdTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0);
    // __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(_timer, block);
    // 开启定时器
    dispatch_resume(_timer);
    return _timer;
}

@end
