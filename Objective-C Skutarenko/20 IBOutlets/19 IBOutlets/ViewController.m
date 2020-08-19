//
//  ViewController.m
//  19 IBOutlets
//
//  Created by user167101 on 3/25/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (strong, nonatomic) IBOutletCollection(UIStackView) NSArray *chessRowStackView;

@end

@implementation ViewController

const int CHECKER_RED_TAG = 1;
const int CHECKER_GREEN_TAG = 2;
const UIColor* redCheckerColor;
const UIColor* greenCheckerColor;

- (instancetype)init
{
    self = [super init];
    if (self) {
        redCheckerColor = [UIColor redColor];
        greenCheckerColor = [UIColor greenColor];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSMutableArray* chessSubviews = [self getViewsFromStackViews:self.chessRowStackView];
    for (UIView* view in chessSubviews) {
        
        switch (view.tag) {
            case CHECKER_RED_TAG:
                view.backgroundColor = (UIColor*)redCheckerColor;
                break;
            case CHECKER_GREEN_TAG:
                view.backgroundColor = (UIColor*)greenCheckerColor;
                break;
            default:
                break;
        }
        
    }
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSMutableArray* chessSubviews = [self getViewsFromStackViews:self.chessRowStackView];
    UIColor* newColor = [self randomColor];
    for (UIView* view in chessSubviews) {
        if (![view.backgroundColor isEqual:[UIColor systemBackgroundColor]]) {
            view.backgroundColor = newColor;
        }
    }
    
}

- (NSMutableArray*)getViewsFromStackViews:(NSArray*)stackViews {
    NSMutableArray* subviews = [[NSMutableArray alloc] init];
    for (UIStackView* stackView in stackViews) {
        [subviews addObjectsFromArray:stackView.subviews];
    }
    return subviews;
}

- (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}


@end
