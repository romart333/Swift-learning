//
//  Boxer.m
//  03 Properties
//
//  Created by user167101 on 3/11/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boxer.h"

@interface Boxer()
// Инкапсуляция с помощью категорий
@property (assign, nonatomic) int nameRequestCount;
@end

@implementation Boxer
// Позволяет переопредеить и геттер и сеттер одновременно
@synthesize name = _name;
- (void)setName:(NSString *)name {
    NSLog(@"Set %@ name", name);
    _name = name;
}

- (NSString *)name {
    NSLog(@"Get %@ name", _name);
    self.nameRequestCount++;
    NSLog(@"Name request count=%d", self.nameRequestCount);
    return _name;
}

@end
