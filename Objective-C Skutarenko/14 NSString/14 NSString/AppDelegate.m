//
//  AppDelegate.m
//  14 NSString
//
//  Created by user167101 on 3/20/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString* text = @"The NSString class and its mutable subclass, NSMutableString, provide an extensive set of APIs for working with strings, including methods for comparing, searching, and modifying strings. NSString objects are used throughout Foundation and other Cocoa frameworks, serving as the basis for all textual and linguistic functionality on the platform.NSString is toll-free bridged with its Core Foundation counterpart, CFStringRef. See Toll-Free Bridging for more information.An NSString object encodes a Unicode-compliant text string, represented as a sequence of UTF–16 code units. All lengths, character indexes, and ranges are expressed in terms of 16-bit platform-endian values, with index values starting at 0. An NSString object can be initialized from or written to a C buffer, an NSData object, or the contents of an NSURL. It can also be encoded and decoded to and from ASCII, UTF–8, UTF–16, UTF–32, or any other string encoding represented by NSStringEncoding. An immutable string is a text string that is defined when it is created and subsequently cannot be changed. An immutable string is implemented as an array of UTF–16 code units (in other words, a text string). To create and manage an immutable string, use the NSString class. To construct and manage a string that can be changed after it has been created, use NSMutableString. The objects you create using NSString and NSMutableString are referred to as string objects (or, when no confusion will result, merely as strings). The term C string refers to the standard char * type. Because of the nature of class clusters, string objects aren’t actual instances of the NSString or NSMutableString classes but of one of their private subclasses. Although a string object’s class is private, its interface is public, as declared by these abstract superclasses, NSString and NSMutableString. The string classes adopt the NSCopying and NSMutableCopying protocols, making it convenient to convert a string of one type to the other.";
//    NSString* str1 = [text substringToIndex: [text length] / 2];
//    NSString* str2 = [text substringFromIndex: [str1 length]];
//    NSLog(@"%@", str1);
//    NSLog(@"%@", str2);
    
    NSArray* sentences = [text componentsSeparatedByString:@"."];
//    for (NSString* s in sentences) {
//        NSLog(@"%@", s);
//    }
    
    NSMutableArray* array = [[NSMutableArray alloc]init];
    for (NSString* s in sentences) {
        NSRange range = [s rangeOfString:@"NSString"];
        if (range.location != NSNotFound) {
            [array addObject:s];
        }
    }
//    NSLog(@"%@", array);
    
    for (int i = 0; i < (array.count / 2) - 1; i++) {
        unsigned long secondIndex = array.count - i - 1;
        NSString* temp = array[secondIndex];
        array[secondIndex] = array[i];
        array[i] = temp;
    }
//    NSLog(@"%@", array);
    
    
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
