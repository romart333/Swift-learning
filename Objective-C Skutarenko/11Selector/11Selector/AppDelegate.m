//
//  AppDelegate.m
//  11Selector
//
//  Created by user167101 on 3/18/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    SEL selector = @selector(testMethod:withParam:);
    NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setSelector:selector];
    [invocation setTarget:self];
    NSInteger one = 1;
    float two = 2;
    NSInteger* p1 = &one;
    float* p2 = &two;
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    
    [invocation invoke];
    
    __unsafe_unretained NSString* string = nil;
    NSString* result = [invocation getReturnValue:&string];
    NSLog(@"%@", string);
    
    
    
    
    return YES;
}

- (NSString *)testMethod:(NSInteger)first withParam:(float)second {
    return [NSString stringWithFormat: @"First param - %d,second - %f", first, second];
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
