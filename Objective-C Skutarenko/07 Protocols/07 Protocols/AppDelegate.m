//
//  AppDelegate.m
//  07 Protocols
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"

#import "Student.h"
#import "Developer.h"
#import "Dancer.h"

#import "Jumper.h"
#import "Swimmer.h"
#import "Runner.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Student* student = [[Student alloc] init];
    Developer* dev = [[Developer alloc] init];
    Dancer* dancer = [[Dancer alloc] init];
    
    student.jumpLength = 1;
    dev.runLength = 3;
    dancer.jumpLength = 1;
    dancer.swimLength = 2;
    dancer.runLength = 3;
    
    NSArray* array = [NSArray arrayWithObjects:student, dev, dancer, nil];
    for (id human in array) {
        if ([human conformsToProtocol:@protocol(Jumper)]) {
            id <Jumper> innerJumper = (id <Jumper>)human;
            [innerJumper jump];
            
            if ([innerJumper respondsToSelector:@selector(fallWhileFly)]) {
                [innerJumper fallWhileFly];
            }
            
        }
        
        if ([human conformsToProtocol:@protocol(Swimmer)]) {
            [(id <Swimmer>)human swim];
        }
        
        if ([human conformsToProtocol:@protocol(Runner)]) {
            [(id <Runner>)human run];
        }
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
