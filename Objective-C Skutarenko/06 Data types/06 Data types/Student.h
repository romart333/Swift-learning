//
//  Student.h
//  06 Data types
//
//  Created by user167101 on 3/12/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#ifndef Student_h
#define Student_h
typedef enum {
    GenderMale,
    GenderFemale
} Gender;

@interface Student : NSObject
@property (assign, nonatomic) Gender gender;
@end

#endif /* Student_h */
