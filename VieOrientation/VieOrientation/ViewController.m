//
//  ViewController.m
//  VieOrientation
//
//  Created by Upixels_ on 17/6/19.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

#define LOG_CURRENT_METHOD NSLog(@"Func:%@", NSStringFromSelector(_cmd));

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (BOOL)shouldAutorotate {
    LOG_CURRENT_METHOD;
    
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    LOG_CURRENT_METHOD;
    
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"TransitionToSize:%@",  NSStringFromCGSize(size));
    LOG_CURRENT_METHOD;
    
}

@end
