//
//  WeakWrapper.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockWrapper.h"

@interface WeakWrapper : NSObject

- (instancetype)initWithWillWeakObj:(id)willWeak;
//- (instancetype)initWithBlock:(GTM_TimerBlock)block;

@end
