//
//  Dancer.m
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dancer.h"

@implementation Dancer
- (void) run {
    NSLog(@"Dancer run %d meters", self.runLength);
}

- (void) jump {
    NSLog(@"Dancer jump %d meters", self.jumpLength);
}

- (void) swim {
    NSLog(@"Dancer swim %d meters", self.swimLength);
}
@end
