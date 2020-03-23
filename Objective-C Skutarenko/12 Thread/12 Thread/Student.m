//
//  Student.m
//  12 Thread
//
//  Created by user167101 on 3/19/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@implementation Student

+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t queue = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

-(void)gcdGessNumber:(NSNumber*)number completionHandler:(void (^)(uint32_t))handler {
    __weak Student* weakSelf = self;
    dispatch_async([Student sharedQueue], ^{
        [weakSelf guessNumber:number completionHandler:handler];
    });
}

- (void)guessNumber:(NSNumber*)number completionHandler:(void (^)(uint32_t))handler {
    @autoreleasepool {
        uint32_t outNumber = number.unsignedIntValue;
        for (;;) {
            uint32_t myNumber = ((float)arc4random() / UINT_FAST32_MAX) * 100;
            if (myNumber == outNumber) {
                handler(myNumber);
                return;
            }
        }
    }
}

@end
