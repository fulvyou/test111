//
//  ViewController.m
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"
#import "MoXieSword.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MoXieSword *moxieSword = [[MoXieSword alloc] initWithName:@"name" producerName:@"producerName" producerAbility:100];

    [moxieSword initSwordAttr];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
