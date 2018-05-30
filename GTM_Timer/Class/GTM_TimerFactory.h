//
//  GTM_TimerFactory.h
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CADisplayLink;
@interface GTM_TimerFactory : NSObject

+ (NSTimer *)nstimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void(^)(NSTimer *timer))block;
//+ (CADisplayLink *)displayLinkWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)sel;
+ (CADisplayLink *)displayLinkWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block;
+ (dispatch_source_t)gcdTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block;

@end
