//
//  main.m
//  ICBTimerWithoutRetainCycle
//
//  Created by caowanping on 17/12/27.
//  Copyright © 2017年 Iceberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSTimer+ICBBlockSupported.h"

@interface TestObject : NSObject {
    NSTimer *mTimer;
    NSTimer *mTimer1;
    NSTimer *mTimer2;
}

@end

@implementation TestObject

- (id)init {
    if (self = [super init]) {
        __weak typeof(self) weakSelf = self;
        mTimer = [NSTimer ICB_timerInitWithFireDate:[NSDate date] interval:2 scheduledBlock:^{
            [weakSelf testFun];
        } repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:mTimer forMode:NSDefaultRunLoopMode];
        
        mTimer1 = [NSTimer ICB_scheduledTimerWithTimeInterval:2 scheduledBlock:^{
            [weakSelf testFun1];
        } repeats:YES];
        
        mTimer2 = [NSTimer ICB_timerWithTimeInterval:2.0 scheduledBlock:^{
            [weakSelf testFun2];
        } repeats:YES];
        
        [[NSRunLoop currentRunLoop] addTimer:mTimer2 forMode:NSDefaultRunLoopMode];
    }
    return self;
}

- (void)testFun {
    NSLog(@"0--Hello, World!");
}

- (void)testFun1 {
    NSLog(@"1--Hello, World!");
}

- (void)testFun2 {
    NSLog(@"2--Hello, World!");
}

@end

#pragma mark - main

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TestObject *testObject = [TestObject new];
        
        [testObject self];
        
        //NSTimer依赖RunLoop，非NSApplication的应用程序需要手动激活RunLoop
        while (YES) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }
    return 0;
}
