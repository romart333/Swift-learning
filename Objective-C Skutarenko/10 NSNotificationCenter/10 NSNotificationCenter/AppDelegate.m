//
//  AppDelegate.m
//  10 NSNotificationCenter
//
//  Created by user167101 on 3/15/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"
#import "Goverment.h"
#import "Doctor.h"
#import "BussinessMan.h"

@interface AppDelegate ()

@property (strong, nonatomic) Doctor* doctor1;
@property (strong, nonatomic) BussinessMan* businessMan1;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    Goverment* goverment = [[Goverment alloc] init];
    
    _doctor1 = [[Doctor alloc] init];
   // Doctor* doctor2 = [[Doctor alloc] init];
   // Doctor* doctor3 = [[Doctor alloc] init];
    
    _businessMan1 = [[BussinessMan alloc] init];
    //BussinessMan* businessMan2 = [[BussinessMan alloc] init];
    
    _doctor1.salary = goverment.salary;
    _businessMan1.taxLevel = goverment.taxLevel;
    
    goverment.salary = 100;
    goverment.taxLevel = 13;
    
    return YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
