//
//  Goverment.h
//  10 NSNotificationCenter
//
//  Created by user167101 on 3/15/20.
//  Copyright © 2020 user167101. All rights reserved.
//

extern NSString* const GovermentDidChangeTaxLevelNotification;
extern NSString* const GovermentDidChangeAveragePriceNotification;
extern NSString* const GovermentDidChangeSalaryNotification;
extern NSString* const GovermentDidChangePensionNotification;

extern NSString* const GovermentDidChangeTaxLevelUserInfoKey;
extern NSString* const GovermentDidChangeAveragePriceNotificationUserInfoKey;
extern NSString* const GovermentDidChangeSalaryNotificationUserInfoKey;
extern NSString* const GovermentDidChangePensionNotificationUserInfoKey;

#ifndef Goverment_h
#define Goverment_h

@interface Goverment : NSObject

@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;

@end

#endif /* Goverment_h */
