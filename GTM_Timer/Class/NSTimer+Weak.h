//
//  NSTimer+Weak.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/29.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Weak)

+ (NSTimer *)wk_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)(NSTimer *timer))block;
+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
