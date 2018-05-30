//
//  CADisplayLink+Block.h
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class BlockWrapper;
@interface CADisplayLink (Block)
@property (nonatomic, strong) BlockWrapper *blockWrap;

@end
