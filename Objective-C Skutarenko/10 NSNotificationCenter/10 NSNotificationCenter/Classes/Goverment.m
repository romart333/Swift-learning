//
//  Goverment.m
//  10 NSNotificationCenter
//
//  Created by user167101 on 3/15/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goverment.h"

extern NSString* const GovermentDidChangeTaxLevelNotification = @"GovermentDidChangeTaxLevelNotification";
extern NSString* const GovermentDidChangeAveragePriceNotification = @"GovermentDidChangeTaxLevelNotification";
extern NSString* const GovermentDidChangeSalaryNotification = @"GovermentDidChangeSalaryNotification";
extern NSString* const GovermentDidChangePensionNotification = @"GovermentDidChangePensionNotification";

extern NSString* const GovermentDidChangeTaxLevelUserInfoKey = @"GovermentDidChangeTaxLevelUserInfoKey";
extern NSString* const GovermentDidChangeAveragePriceNotificationUserInfoKey = @"GovermentDidChangeAveragePriceNotificationUserInfoKey";
extern NSString* const GovermentDidChangeSalaryNotificationUserInfoKey = @"GovermentDidChangeSalaryNotificationUserInfoKey";
extern NSString* const GovermentDidChangePensionNotificationUserInfoKey = @"GovermentDidChangePensionNotificationUserInfoKey";

@implementation Goverment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _salary = 1000;
        _taxLevel = 10;
        _averagePrice = 15;
        _pension = 500;
    }
    return self;
}

- (void) setSalary:(float)salary {
    NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:salary], GovermentDidChangeSalaryNotificationUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentDidChangeSalaryNotification
                                                        object:nil
                                                      userInfo:userInfo];
    _salary = salary;
}

- (void) setPension:(float)pension {
    NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:pension], GovermentDidChangePensionNotificationUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentDidChangePensionNotification
                                                        object:nil
                                                      userInfo:userInfo];
    _pension = pension;
}

- (void) setTaxLevel:(float)taxLevel {
    NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:taxLevel], GovermentDidChangeTaxLevelUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentDidChangeTaxLevelNotification
                                                        object:nil
                                                      userInfo:userInfo];
    _taxLevel = taxLevel;
}

- (void) setAveragePrice:(float)averagePrice {
    NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:averagePrice], GovermentDidChangeAveragePriceNotificationUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovermentDidChangeAveragePriceNotification
                                                        object:nil
                                                      userInfo:userInfo];
    _averagePrice = averagePrice;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
