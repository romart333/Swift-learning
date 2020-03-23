//
//  AppDelegate.m
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Doctor.h"
#import "Friend.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Patient* patient1 = [[Patient alloc] init];
    patient1.temperature = 37.f;
    patient1.name = @"one";
    Patient* patient2 = [[Patient alloc] init];
    patient2.temperature = 38.f;
    patient2.name = @"two";
    
    Patient* patient3 = [[Patient alloc] init];
    patient3.temperature = 39.f;
    patient3.name = @"three";
    Patient* patient4 = [[Patient alloc] init];
    patient4.temperature = 40.f;
    patient4.name = @"four";
    
   
    Doctor* doctor = [[Doctor alloc] init];
    Friend* friend = [[Friend alloc] init];
    Friend* friend2 = [[Friend alloc] init];
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = friend;
    patient4.delegate = friend2;
    NSArray* array = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, nil];
    for (Patient* p in array) {
        [p didBecomeIll];
    }
    
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
