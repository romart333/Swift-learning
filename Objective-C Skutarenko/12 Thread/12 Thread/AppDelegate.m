//
//  AppDelegate.m
//  12 Thread
//
//  Created by user167101 on 3/19/20.
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
    Student* student4 = [[Student alloc] init];
    Student* student5 = [[Student alloc] init];
    NSArray* array = [NSArray arrayWithObjects:student1, student2, student3, student4, student5, nil];
    for (Student* st in array) {
        uint32_t intNumber = ((float)arc4random() / UINT_FAST32_MAX) * 100;
        NSNumber* number = [NSNumber numberWithUnsignedInt:intNumber];
        // Нужно в объект положить дикшинари из числа и блока
//        NSThread* thread = [[NSThread alloc] initWithTarget:st selector:@selector(guessNumber:completionHandler:) object:number];
//         [thread start];
        [st gcdGessNumber:number completionHandler:^(uint32_t studentNumber) {
            NSLog(@"Student finish with number %u", studentNumber);
        }];
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
