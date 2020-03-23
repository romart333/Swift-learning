//
//  AppDelegate.m
//  12 Block
//
//  Created by user167101 on 3/18/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Patient.h"

@interface AppDelegate ()
Patient* patient;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    Student* student1 = [[Student alloc] init];
//    Student* student2 = [[Student alloc] init];
//    Student* student3 = [[Student alloc] init];
//    Student* student4 = [[Student alloc] init];
//    student1.name = @"h";
//    student1.family = @"j";
//    student2.name = @"s";
//    student2.family = @"w";
//    student3.name = @"u";
//    student3.family = @"e";
//    student4.name = @"a";
//    student4.family = @"e";
//
//    NSArray* array = [NSArray arrayWithObjects:student1, student2, student3, student4, nil];
//    NSArray* sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        Student* st1 = obj1;
//        Student* st2 = obj2;
//
//        if (st1.family != st2.family) {
//            return [st1.family compare:st2.family];
//        }
//
//        return [st1.name compare:st2.name];
//    }];
//
//    for (Student* st in sortedArray) {
//        NSLog(@"%@ - %@", st.name, st.family);
//    }
    
    
    Patient* patient = [[Patient alloc] init];
    patient.name = @"Pat";
    patient.temperature = 40;
    [patient didBecomeIll:^(Patient *patient) {
         if (patient.temperature <= 38) {
               [patient takePill];
           } else {
               [patient makeShot];
           }
    } withPatient:patient];
    
    
    
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
