//
//  ViewController.m
//  GTM_TimerExample
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "ViewController.h"
#import "TimerTestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TimerTestViewController *vc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"NSTimer"]) {
        vc.timerType = ETimerTypeNSTimer;
        vc.title = @"NSTimer Demo";
    } else if ([segue.identifier isEqualToString:@"CADisplayLink"]) {
        vc.timerType = ETimerTypeDisplayLink;
        vc.title = @"CADisplayLink Demo";
    }
    else if ([segue.identifier isEqualToString:@"GCD"]) {
        vc.timerType = ETimerTypeGCD;
        vc.title = @"GCD Timer Demo";
    }
}


@end
