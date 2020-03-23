//
//  Student.h
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//
#import "Jumper.h"
#ifndef Student_h
#define Student_h
@interface Student : NSObject <Jumper>
@property (assign, nonatomic) int jumpLength;
@end

#endif /* Student_h */
