//
//  Patient.m
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@implementation Patient

- (void) didBecomeIll {
    [self.delegate patientGetHealing:self];
}
- (void) takePill {
    NSLog(@"%@ Take pill", self.name);
}
- (void) makeShot {
    NSLog(@"Make shot to %@", self.name);
}

- (void) eatHerb {
    NSLog(@"%@ eat herb", self.name);
}

@end
