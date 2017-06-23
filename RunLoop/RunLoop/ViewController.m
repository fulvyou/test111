//
//  ViewController.m
//  RunLoop
//
//  Created by Upixels_ on 17/6/22.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) showBlockAlert {
    CFRunLoopRef currentLoop = CFRunLoopGetCurrent();
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"tittle:%@",action.title);
    }];
    
    UIAlertController *alertVC = [[UIAlertController alloc] init];
    
    [self presentViewController:alertVC animated:YES completion:^{
        NSLog(@"Load success!");
    }];
    
    CFRunLoopRun();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
