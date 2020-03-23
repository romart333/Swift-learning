//
//  Student.h
//  12 Thread
//
//  Created by user167101 on 3/19/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#ifndef Student_h
#define Student_h
@interface Student : NSObject
@property (assign, nonatomic) int u;
@property (strong, nonatomic) dispatch_queue_t queue;
-(void)gcdGessNumber:(NSNumber*)number completionHandler:(void (^)(uint32_t))handler;
- (void)guessNumber:(NSNumber*)number completionHandler:(void (^)(uint32_t))handler;
@end

#endif /* Student_h */
