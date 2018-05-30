//
//  BlockWrapper.m
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "BlockWrapper.h"

@implementation BlockWrapper


- (void)excuteBlock {
    if (_block) {
        _block();
    }
}

- (void)dealloc
{
    NSLog(@"BlockWrapper dealloc...");
}


@end
