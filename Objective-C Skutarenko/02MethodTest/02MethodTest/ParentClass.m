//
//  ParentClass.m
//  02MethodTest
//
//  Created by user167101 on 3/10/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentClass.h"

@implementation ParentClass : NSObject

- (void) method {
    NSLog(@"Hello");
}

- (void) say: (NSString *) text {
    NSLog(@"%@", text);
}

- (void) say: (NSString *) text and:(NSString *) text2 {
    NSLog(@"%@ %@", text, text2);
}

- (NSString *) getNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString *) getString {
    return [self getNumberString];
}

@end

