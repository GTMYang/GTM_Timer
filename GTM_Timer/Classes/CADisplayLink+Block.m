//
//  CADisplayLink+Block.m
//  GTM_Timer
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//
#import <objc/runtime.h>
#import "CADisplayLink+Block.h"

@implementation CADisplayLink (Block)

- (BlockWrapper *)blockWrap {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBlockWrap:(BlockWrapper *)blockWrap {
    objc_setAssociatedObject(self, @selector(blockWrap), blockWrap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - hook invalidate method

+ (void)load {
    Method old = class_getInstanceMethod(self, @selector(invalidate));
    Method new = class_getInstanceMethod(self, @selector(GTM_invalidate));
    method_exchangeImplementations(old, new);
}

- (void)GTM_invalidate {
    [self GTM_invalidate];
    self.blockWrap = nil;
}

@end
