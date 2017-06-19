//
//  ViewController.m
//  Animation
//
//  Created by Upixels_ on 17/6/19.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
}

@property (nonatomic) UIView *whiteView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.whiteView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteView];
    
    self.view.backgroundColor = [UIColor blackColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    [btn setTitle:@"animal1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animal1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [UIView setAnimationDelegate:self];
}

- (void) animal1 {
    NSLog(@"动画-1");
    
    CGContextRef context= UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"transtlation" context:context];
    
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelay:1.0f];
    
    self.whiteView.center = self.view.center;
    [UIView commitAnimations];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"start 动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"stop 动画");
    
    CGContextRef context= UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"alpha" context:context];
    [UIView setAnimationBeginsFromCurrentState:YES];//打断同一个消息循环中的已有的动画
    
    [UIView setAnimationDuration:2.0f];
    
    self.whiteView.alpha = 0.0f;
    [UIView commitAnimations];
    
}



@end
