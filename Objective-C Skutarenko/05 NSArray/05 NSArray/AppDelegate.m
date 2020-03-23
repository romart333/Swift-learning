//
//  AppDelegate.m
//  05 NSArray
//
//  Created by user167101 on 3/11/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "MyChildObj.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSArray * array = [[NSArray alloc] initWithObjects:@"Str1", @"Str2", nil];
//    NSArray* array = [NSArray arrayWithObjects:@"Str1", @"Str2", nil];
    
    NSArray* array = @[@"Str1", @"Str2"];
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@",[array objectAtIndex:i]);
    }
    
    for (NSString * item in array) {
        NSLog(@"%@", item);
        NSLog(@"%lu", [array indexOfObject:item]);
    }
    
    
    MyObj* obj = [[MyObj alloc] init];
    obj.name = @"name obj";
    
    MyChildObj* child = [[MyChildObj alloc] init];
    child.name = @"child name";
    child.lastName = @"last name child";
    NSArray* objects = [NSArray arrayWithObjects:obj, child, nil];
    for (MyObj* o in objects) {
        NSLog(@"name = %@",o.name);
        [o action];
        if ([o isKindOfClass:[MyChildObj class]]) {
            NSString* lastName = ((MyChildObj*)o).lastName;
            NSLog(@"lastName = %@", lastName);
        }
    }
    
    return YES;
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
