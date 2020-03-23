//
//  Runner.h
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Runner <NSObject>
@property (assign, nonatomic) int runLength;
- (void) run;
@end

NS_ASSUME_NONNULL_END
