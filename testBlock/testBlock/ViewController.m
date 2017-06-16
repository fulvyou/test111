//
//  ViewController.m
//  testBlock
//
//  Created by Upixels_ on 17/6/16.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

typedef int(^blockType1)(int A, int B);

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    blockType1 block1 = ^(int A, int B) {
        return A*B;
    };
    int result1 = block1(1, 2);
    NSLog(@"result1:%d", result1);
    
    int(^block2)(int A, int B) = ^(int A, int B) {
        return A+B;
    };
    
    int result2 = block2(1, 2);
    NSLog(@"result2:%d", result2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
