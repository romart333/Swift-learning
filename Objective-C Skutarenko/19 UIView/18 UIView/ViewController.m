//
//  ViewController.m
//  18 UIView
//
//  Created by user167101 on 3/23/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
  
@end

@implementation ViewController

const int CHESS_DESK_SIZE = 8;
//const NSArray* colors

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = self.view.frame;
//    NSLog(@"Main Frame : %@", NSStringFromCGRect(self.view.frame));
    CGSize frameSize = frame.size;
    CGFloat chessDeskSide = MIN(frameSize.height, frameSize.width);
    CGSize middlePoint = CGSizeMake(frameSize.width / 2, frameSize.height / 2);
    
    CGRect chessDeskFrame = CGRectMake(
                                       middlePoint.width - (chessDeskSide / 2),
                                       middlePoint.height - (chessDeskSide / 2),
                                       chessDeskSide,
                                       chessDeskSide);
    UIView* chessDeskView = [[UIView alloc] initWithFrame:chessDeskFrame];
//    NSLog(@"Frame : %@", NSStringFromCGRect(chessDeskView.frame));
//    NSLog(@"bounds screen: %@", NSStringFromCGRect(chessDeskView.bounds));
    [self.view addSubview:chessDeskView];
    chessDeskView.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    
    CGFloat chessViewSide = chessDeskSide / CHESS_DESK_SIZE;
    for (int i = 0; i < CHESS_DESK_SIZE; i++) {
        for (int j = 0; j < CHESS_DESK_SIZE; j++) {
            if ((i + j) % 2 == 0) {
                CGRect subviewFrame = CGRectMake(
                                                 i * chessViewSide,
                                                 j * chessViewSide,
                                                 chessViewSide,
                                                 chessViewSide);
              
                UIView* subview = [[UIView alloc] initWithFrame:subviewFrame];
                subview.backgroundColor = [UIColor blackColor];
                [chessDeskView addSubview:subview];
//                NSLog(@"For (%d, %d):---%@---", j, i, NSStringFromCGRect(subviewFrame));
//                NSLog(@"For (%d, %d):---%@---", j, i, NSStringFromCGRect(subview.bounds));
            }
        }
    }
    // Do any additional setup after loading the view.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    UIView* chessDeskView = [self.view.subviews objectAtIndex:0];
    NSArray* subviews = chessDeskView.subviews;
    UIColor* color = [self randomColor];
    for (UIView* view in subviews) {
        view.backgroundColor = color;
    }
}

- (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}







@end
