//
//  Dancer.h
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//
#import "Jumper.h"
#import "Runner.h"
#import "Swimmer.h"
#ifndef Dancer_h
#define Dancer_h
@interface Dancer : NSObject <Jumper, Runner, Swimmer>
@property (assign, nonatomic) int runLength;
@property (assign, nonatomic) int jumpLength;
@property (assign, nonatomic) int swimLength;
@end

#endif /* Dancer_h */
