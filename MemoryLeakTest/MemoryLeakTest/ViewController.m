//
//  ViewController.m
//  MemoryLeakTest
//
//  Created by Upixels_ on 17/6/23.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat scale  = [[UIScreen mainScreen] scale];
    NSLog(@"current screen scale:%f", scale);
}

- (NSString *)getName {
    return [[NSString alloc] initWithString:@"123"];
//    return [[[NSString alloc] initWithString:@"123"] autorelease];
//    return [NSString stringWithFormat:@"123"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
