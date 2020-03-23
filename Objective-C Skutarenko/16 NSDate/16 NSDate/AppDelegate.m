//
//  AppDelegate.m
//  16 NSDate
//
//  Created by user167101 on 3/20/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Student* student1 = [[Student alloc] init];
    Student* student2 = [[Student alloc] init];
    Student* student3 = [[Student alloc] init];
    student1.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:86400 * 365];
    student2.dateOfBirth = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
    student3.dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSMutableArray* students = [NSMutableArray arrayWithObjects:student2, student1, student3, nil];
    NSString* format = @"dd-M-yyy";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
//    for (Student* st in students) {
//        NSLog(@"%@", [dateFormatter stringFromDate:st.dateOfBirth]);
//    }
//
    students = [[students sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Student* st1 = obj1;
        Student* st2 = obj2;
        return [st1.dateOfBirth compare:st2.dateOfBirth];
    }] mutableCopy];
//    for (Student* st in students) {
//          NSLog(@"%@", [dateFormatter stringFromDate:st.dateOfBirth]);
//    }
    
    int secondsInDay = 86400;
    NSDate* startDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
//    [NSTimer scheduledTimerWithTimeInterval:0.0002 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        int timerDays = [[NSDate date] timeIntervalSinceDate:startDate] * (5000 - 1);
//        NSCalendar* calendar = [NSCalendar currentCalendar];
//        NSDate* timerDate = [NSDate dateWithTimeIntervalSince1970:secondsInDay * timerDays];
//        NSDateComponents* timerComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate:timerDate];
//        for (Student* st in students) {
//            NSDateComponents* studentComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate:st.dateOfBirth];
//
//            if ([studentComponents year] == [timerComponents year] &&
//                [studentComponents month] == [timerComponents month] &&
//                [studentComponents day] == [timerComponents day]) {
//                NSLog(@"Birthday!!! %@", [dateFormatter stringFromDate:st.dateOfBirth]);
//            }
//            if ([timerComponents year] == 2021) {
//                timer.invalidate;
//            }
//        }
//    }];
    Student* youngerSt = student1;
    Student* oldesSt = student2;
    for (Student* st in students) {
        if ([st.dateOfBirth compare:youngerSt.dateOfBirth] == NSOrderedAscending) {
            youngerSt = st;
        }
        
        if ([st.dateOfBirth compare:oldesSt.dateOfBirth] == NSOrderedDescending) {
            oldesSt = st;
        }
    }
    NSLog(@"Youngest - %@, oldest - %@", youngerSt.dateOfBirth, oldesSt.dateOfBirth);
  
     NSDateComponents* components =
    [calendar components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth
                fromDate:youngerSt.dateOfBirth
                  toDate:oldesSt.dateOfBirth
                 options:0];
    NSLog(@"%@", components);
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
