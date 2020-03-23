//
//  Developer.h
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//
#import "Runner.h"
#ifndef Developer_h
#define Developer_h
@interface Developer : NSObject <Runner>
@property (assign, nonatomic) int runLength;
@end

#endif /* Developer_h */
