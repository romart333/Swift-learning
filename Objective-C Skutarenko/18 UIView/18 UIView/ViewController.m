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
//      NSLog(@"bounds screen: %@", NSStringFromCGRect(chessDeskView.bounds));
    [self.view addSubview:chessDeskView];
    
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

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//  //  CGRect frame = self.view.frame;
//    CGFloat viewHeight = size.height;
//    CGFloat viewWidth = size.width;
//    float subviewHeight = viewHeight / CHESS_TABLE_SIZE;
//    float subviewWidth = viewWidth / CHESS_TABLE_SIZE;
//       for (int i = 0; i < CHESS_TABLE_SIZE; i++) {
//           for (int j = 0; j < CHESS_TABLE_SIZE; j++) {
//               if ((i + j) % 2 == 0) {
//                   CGRect subviewFrame = CGRectMake(
//                                                    i * subviewWidth,
//                                                    j * subviewHeight,
//                                                    subviewWidth,
//                                                    subviewHeight);
//                   NSLog(@"%@", NSStringFromCGRect(subviewFrame));
//                   UIView* subview = [[UIView alloc] initWithFrame:subviewFrame];
//                   subview.backgroundColor = [UIColor blackColor];
//                   [self.view addSubview:subview];
//               }
//           }
//       }
//    NSLog(@"Frame is ready");
//    
//    
//    
//    
//}







@end
