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
    @property (strong, nonatomic) NSMutableArray* startSquareViews;
    @property (strong, nonatomic) NSArray* checkerViews;
    @property (strong, nonatomic) UIView* chessView;
    @property (strong, nonatomic) NSArray* allSquareViews;

    @property (weak, nonatomic)   UIView* draggingiew;
    @property (assign, nonatomic) CGPoint touchOffset;


typedef enum : NSUInteger {
  TopCheckerSquareViewTag = 1,
  BottomCheckerSqaureViewTag = 2,
  NonCheckerSquareViewTag = 4
} StartSquareViewTag;
@end

@implementation ViewController

const int TOP_CHECKER_TAG = 8;
const int BOTTOM_CHECKER_TAG = 16;
//const int ALLOWED_CHECKER_PLACE_TAG = 1;

const UIColor* TOP_CHECKER_COLOR;
const UIColor* BOTTOM_CHECKER_COLOR;
const int CHECKER_COUNT = 24;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        TOP_CHECKER_COLOR = [UIColor blueColor];
        BOTTOM_CHECKER_COLOR = [UIColor redColor];
        self.startSquareViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSMutableArray* checkerViews = [[NSMutableArray alloc] init];
    for (int i = 0; i < CHECKER_COUNT; i++) {
        UIView* view = [[UIView alloc] initWithFrame:CGRectZero];
        [checkerViews addObject:view];
    }
    self.checkerViews = checkerViews;
    
    self.chessView = [self.view.subviews objectAtIndex:0];
    self.allSquareViews = [self getSubviewsFromStackViews:self.chessRowStackView];
    for (UIView* view in self.allSquareViews) {
        if ([self isStartPositionTag:view.tag]) {
            [self.startSquareViews addObject:view];
        }
    }
    
    [self putCheckersOnStartPositions];
}

- (void)putCheckersOnStartPositions {
    for (int i = 0; i < CHECKER_COUNT; i++) {
        UIView* checkerView = [self.checkerViews objectAtIndex:i];
        UIView* startSquareView = [self.startSquareViews objectAtIndex:i];
        
        CGRect checkerFrame = [self.view convertRect:startSquareView.bounds fromView:startSquareView];
        checkerView.frame = checkerFrame;
        checkerView.layer.cornerRadius = checkerFrame.size.height / 2;
        StartSquareViewTag checkerPlaceTag = startSquareView.tag;
        checkerView.backgroundColor = [self getColorByCheckerPlaceTag:checkerPlaceTag];
        checkerView.tag = [self getCheckerTagByCheckerPlaceTag:checkerPlaceTag];
        NSLog(
              @"%@ %@",
              NSStringFromCGPoint([checkerView convertPoint:checkerView.center toView:self.chessView]),
              NSStringFromCGPoint([startSquareView convertPoint:startSquareView.center toView:self.chessView]));
        [self.view addSubview:checkerView];
    }
}

- (int)getCheckerTagByCheckerPlaceTag:(StartSquareViewTag)tag {
    if (BottomCheckerSqaureViewTag == tag) {
        return BOTTOM_CHECKER_TAG;
    } else {
        return TOP_CHECKER_TAG;
    }
}

- (UIColor*)getColorByCheckerPlaceTag:(StartSquareViewTag)tag {
    if (BottomCheckerSqaureViewTag == tag) {
        return BOTTOM_CHECKER_COLOR;
    } else {
        return TOP_CHECKER_COLOR;
    }
}

- (void)viewWillLayoutSubviews {
    NSLog(@"Layout");
//    for (UIView* view in self.checkerViews) {
//
//        switch (view.tag) {
//            case TopCheckerPlaceTag:
//                [self putCheckerToView:view withColor:TOP_CHECKER_COLOR];
//
//                break;
//            case BottomCheckerPlaceTag:
//                [self putCheckerToView:view withColor:BOTTOM_CHECKER_COLOR];
//                break;
//            default:
//                break;
//        }
//    }
}
//int buf = 0;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    UIColor* newColor = [self randomColor];
//    UIView* view = [self.chessSubviews objectAtIndex:buf];
   
    for (UIView* view in self.allSquareViews) {
        if ([self isAllowedCheckerPlace:view.tag]) {
            view.backgroundColor = newColor;
        }
    }
}

- (BOOL)isViewHasChecker:(UIView*)view {
    return ![self isFirstSubviewNil:view];
}

- (BOOL)isFirstSubviewNil:(UIView*)view {
    UIView* checker = [view.subviews objectAtIndex:0];
    return checker != nil;
}

- (NSMutableArray*)getSubviewsFromStackViews:(NSArray*)stackViews {
    NSMutableArray* subviews = [[NSMutableArray alloc] init];
    for (UIStackView* stackView in stackViews) {
        [subviews addObjectsFromArray:stackView.subviews];
    }
    return subviews;
}
//
//- (void)putCheckerToView:(UIView*)view withColor:(UIColor*)color {
//    CGPoint viewFrameOrigin = view.frame.origin;
//    CGRect viewBounds = view.bounds;
//    float checkerSize = viewBounds.size.height / 2;
//
//    UIView* checkerView = [[UIView alloc] initWithFrame:CGRectMake(
//                                                               0,0,
//                                                               checkerSize,
//                                                               checkerSize)];
//    checkerView.backgroundColor = color;
////    NSLog(@"%@",NSStringFromCGRect(checkerView.frame));
//    [view addSubview:checkerView];
//}

- (BOOL)isAllowedCheckerPlace:(StartSquareViewTag)checkerPlaceTag {
    return  checkerPlaceTag & 7;
}

- (BOOL)isStartPositionTag:(StartSquareViewTag)checkerPlaceTag {
    return checkerPlaceTag & 3;
}

- (BOOL)isCheckerTag:(StartSquareViewTag)checkerPlaceTag {
    return checkerPlaceTag & 24;
}


- (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    return color;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView* view = [self.view hitTest:pointOnMainView withEvent:event];
    NSLog(@"Point:%@", NSStringFromCGPoint(pointOnMainView));
    NSLog(@"Rect:%@", NSStringFromCGRect(view.frame));
    if ([self isCheckerTag:view.tag]) {
        self.draggingiew = view;
        [self.view bringSubviewToFront:view];
        CGPoint touchPoint = [touch locationInView:view];
        CGRect viewBounds = view.bounds;
        self.touchOffset = CGPointMake(
                                       CGRectGetMidX(viewBounds) - touchPoint.x,
                                       CGRectGetMidY(viewBounds) - touchPoint.y);
        __weak __typeof(self) weakSelf = self;
        [UIView
         animateWithDuration:0.3
         animations:^{
            weakSelf.draggingiew.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                          1.2f,
                                                          1.2f);
            weakSelf.draggingiew.alpha = 0.8;
        }];
    } else {
        self.draggingiew = nil;
    }
}

//- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
//        return [self hitTest:point withEvent:event];
//}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.draggingiew) {
        UITouch* touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        CGPoint correction = CGPointMake(
                                         pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        self.draggingiew.center = correction;
        
    }
}

- (void)touchesEnded {
    __weak __typeof(self) weakSelf = self;
    [UIView
     animateWithDuration:0.3
     animations:^{
        weakSelf.draggingiew.transform = CGAffineTransformIdentity;
        weakSelf.draggingiew.alpha = 1.f;
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded];
    self.draggingiew = nil;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded];
    self.draggingiew = nil;
}

@end
