//
//  Doctor.m
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"

@implementation Doctor
- (void) patientGetHealing:(Patient*)patient {
    if (patient.temperature <= 38) {
        [patient takePill];
    } else {
        [patient makeShot];
    }
}

@end
