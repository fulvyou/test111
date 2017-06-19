//
//  ViewController.m
//  AlertViewTest
//
//  Created by Upixels_ on 17/6/19.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    [btn setTitle:@"test" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(showSecureTextInputAlert) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(showSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void) showSecureTextInputAlert {
//    UITextField *txtField = nil;
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"tittle" message:@"my message" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"ok", nil];
//    alert.tag = kAlertText
    
    UIAlertController *alert = [[UIAlertController alloc] init];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"action tittle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"did action!");
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"show alertView!");
    }];
}

- (void) showSheet {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"sheet tittle" delegate:self cancelButtonTitle:@"cancle" destructiveButtonTitle:@"destruct" otherButtonTitles:@"other1", @"other2", @"other3", @"other4", @"other5",@"other6",@"other7",@"other8",@"other9",@"other10",@"other11", nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clicked %ld button", buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
