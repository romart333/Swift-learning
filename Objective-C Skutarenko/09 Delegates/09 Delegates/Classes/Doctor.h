//
//  Doctor.h
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//
#import "Patient.h"
#ifndef Doctor_h
#define Doctor_h
@interface Doctor : NSObject <PatientDelegate>
@end


#endif /* Doctor_h */
