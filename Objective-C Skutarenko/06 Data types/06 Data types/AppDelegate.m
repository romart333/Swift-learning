//
//  AppDelegate.m
//  06 Data types
//
//  Created by user167101 on 3/12/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSInteger nsInt = 1;
    NSUInteger nsUint = 2;
    CGFloat cgFloat = 3.0f;
    double doub = 4.0;
    // Работа с массивом примитивных данных
    // NSNumber и NSValue для примитивных типов данных.Второй для структур
    NSNumber* numInt = [NSNumber numberWithInteger:nsInt];
    NSNumber* numUint = [NSNumber numberWithUnsignedInteger:nsUint];
    NSNumber* numFloat = [NSNumber numberWithFloat:cgFloat];
    NSNumber* numDouble = [NSNumber numberWithDouble:doub];
    CGPoint point = CGPointMake(1, 2);
    NSArray* array = [NSArray arrayWithObjects:numInt, numUint, numFloat, numDouble, [NSValue valueWithCGPoint:point], nil];
  
    NSLog(@"int = %ld, uint = %ld, float = %f, double = %f, point = %@",
          [[array objectAtIndex:0] integerValue],
          [[array objectAtIndex:1] unsignedIntegerValue],
          [[array objectAtIndex:2] floatValue],
          [[array objectAtIndex:3] doubleValue],
          NSStringFromCGPoint([[array objectAtIndex:4] CGPointValue]));
    
    
    
    NSInteger i = 5;
    [self changeInt:&i];
    NSLog(@"%ld", i);
    Student *student =  [[Student alloc] init];
    student.gender = GenderMale;
    NSLog(@"%@", [student gender]);
    
    return YES;
}

- (void)changeInt:(NSInteger*)byPointer {
    *byPointer = *byPointer * 2;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
