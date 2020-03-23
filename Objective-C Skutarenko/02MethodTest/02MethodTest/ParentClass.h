//
//  ParentClass.h
//  02MethodTest
//
//  Created by user167101 on 3/10/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#ifndef ParentClass_h
#define ParentClass_h
@interface ParentClass : NSObject 
- (void)method;
- (void) say: (NSString *) text;
- (void) say: (NSString *) text and: (NSString *) text2;
- (NSString *) getString;
@end


#endif /* ParentClass_h */
