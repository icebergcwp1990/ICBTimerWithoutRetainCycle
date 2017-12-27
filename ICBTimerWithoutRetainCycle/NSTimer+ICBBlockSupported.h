//
//  NSTimer+ICBBlockSupported.h
//  ICBTimerWithoutRetainCycle
//
//  Created by caowanping on 17/12/27.
//  Copyright © 2017年 Iceberg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ICBTimerScheduledBlock)(void);

@interface NSTimer (ICBBlockSupported)

+ (NSTimer *)ICB_timerInitWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)rep;

+ (NSTimer *)ICB_timerWithTimeInterval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)yesOrNo;

+ (NSTimer *)ICB_scheduledTimerWithTimeInterval:(NSTimeInterval)ti scheduledBlock:(ICBTimerScheduledBlock)block repeats:(BOOL)yesOrNo;


@end
