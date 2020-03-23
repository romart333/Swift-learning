//
//  Doctor.m
//  10 NSNotificationCenter
//
//  Created by user167101 on 3/15/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Goverment.h"

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(salaryChanghedNotification:) name:GovermentDidChangeSalaryNotification object:nil];
        [nc addObserver:self selector:@selector(sleepNotification:) name:NSExtensionHostDidEnterBackgroundNotification object:nil];
         [nc addObserver:self selector:@selector(awakeNotification:) name:NSExtensionHostDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (void) salaryChanghedNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:GovermentDidChangeSalaryNotificationUserInfoKey];
    float newSalary = value.floatValue;
    
    if (newSalary > _salary) {
        NSLog(@"Doctor is happy");
    } else {
        NSLog(@"Doctor is not happy ");
    }
    
    self.salary = newSalary;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) sleepNotification:(NSNotification*)notification {
       NSLog(@"Doctor go to sleep");
}

- (void) awakeNotification:(NSNotification*)notification {
       NSLog(@"Doctor awake");
}

@end

