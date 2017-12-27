//
//  NSTimer+ICBBlockSupported.m
//  ICBTimerWithoutRetainCycle
//
//  Created by caowanping on 17/12/27.
//  Copyright © 2017年 Iceberg. All rights reserved.
//

#import "NSTimer+ICBBlockSupported.h"

@implementation NSTimer (ICBBlockSupported)

+ (NSTimer *)ICB_timerInitWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)rep {
    return [[NSTimer alloc] initWithFireDate:date interval:ti target:[self class] selector:@selector(ICB_timerFireFun:) userInfo:block repeats:rep];
}

+ (NSTimer *)ICB_timerWithTimeInterval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)yesOrNo {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(ICB_timerFireFun:) userInfo:block repeats:yesOrNo];
}

+ (NSTimer *)ICB_scheduledTimerWithTimeInterval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)yesOrNo {
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(ICB_timerFireFun:) userInfo:block repeats:yesOrNo];
}

#pragma mark - Fire

+ (void)ICB_timerFireFun:(NSTimer *)timer {
    ICBTimerScheduledBlock block = timer.userInfo;
    if (block) {
        block();
    }
}

@end
