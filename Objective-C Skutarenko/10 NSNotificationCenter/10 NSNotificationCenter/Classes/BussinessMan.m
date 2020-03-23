//
//  BussinessMan.m
//  10 NSNotificationCenter
//
//  Created by user167101 on 3/15/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goverment.h"
#import "BussinessMan.h"
#import <UIKit/UIKit.h>
@implementation BussinessMan

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelChagedNotification:)
                   name:GovermentDidChangeTaxLevelNotification
                 object:nil];
        [nc addObserver:self selector:@selector(sleepNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [nc addObserver:self selector:@selector(awakeNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void) taxLevelChagedNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:GovermentDidChangeTaxLevelUserInfoKey];
    float newTaxLevel = value.floatValue;
    
    if (newTaxLevel > self.taxLevel) {
        NSLog(@"Businessman is happy");
    } else {
        NSLog(@"Businessman is not happy ");
    }
    
    self.taxLevel = newTaxLevel;
}

- (void) sleepNotification:(NSNotification*)notification {
       NSLog(@"Business man go to sleep");
}

- (void) awakeNotification:(NSNotification*)notification {
       NSLog(@"Business man awake");
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
