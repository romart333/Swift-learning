//
//  Friend.m
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Friend.h"

@implementation Friend
- (void) patientGetHealing:(Patient*)patient {
    if (patient.temperature >= 37) {
        [patient eatHerb];
    }
}
@end
