//
//  BlockWrapper.h
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GTM_TimerBlock)(void);

@interface BlockWrapper : NSObject
@property (nonatomic, copy) GTM_TimerBlock block;

- (void)excuteBlock;

@end
