//
//  Jumper.h
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// <NSObject> - наследование протокола
@protocol Jumper <NSObject>
@required
@property (assign, nonatomic) int jumpLength;
- (void) jump;

@optional
- (void) fallWhileFly;
@end


NS_ASSUME_NONNULL_END
