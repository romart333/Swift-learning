//
//  ViewController.m
//  21 Animations
//
//  Created by user167101 on 3/27/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) NSArray* views;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float viewSize = (float)CGRectGetHeight(self.view.frame) / 10;
    NSMutableArray* array = [[NSMutableArray alloc] init];
    int topOffset = 50;
    for (int i = 0; i < 4; i++) {
           UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 2 * viewSize * i + topOffset, viewSize, viewSize)];
           [array addObject:view];
           view.backgroundColor = [self randomColor];
           [self.view addSubview:view];
       }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    int i = 0;
    for (UIView* view in self.view.subviews) {
        float viewSize = CGRectGetHeight(view.bounds);
        __weak weakView = self.view;
        [UIView animateWithDuration:2.5
                              delay:i
                            options: i << 16 | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                         animations:^{
            view.center = CGPointMake(CGRectGetWidth(self.view.frame) - viewSize / 2, view.center.y);
            view.backgroundColor = [self randomColor];
            view.transform3D = CATransform3DMakeRotation(3.14, 80, 0, 0);
        }
                         completion:^(BOOL finished) {
            NSLog(@"Finish");
        }];
        i++;
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
