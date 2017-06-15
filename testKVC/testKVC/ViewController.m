//
//  ViewController.m
//  testKVC
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"
#import "club.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //KVC的测试
    footballer *raul= [[footballer alloc] init];
    raul.name = @"Raul";
    //    raul.no = 7;
    
    footballer *beckham= [[footballer alloc] init];
    beckham.name = @"Beckham";
    beckham.no = 23;
    
    footballer *ronaldo= [[footballer alloc] init];
    [ronaldo setValue:@"Ronaldo" forKey:@"name"];
    [ronaldo setValue:[NSNumber numberWithInt:9] forKey:@"no"];
    //    [ronaldo setValue:@2 forKeyPath:@"linkedInstance.integerProperty"];
    
    
    club *realMadrid = [[club alloc] init];
    [realMadrid.members addObject:raul];
    [realMadrid.members addObject:beckham];
    [realMadrid.members addObject:ronaldo];
    
    realMadrid.captain = raul;
    
    [realMadrid setValue:[NSNumber numberWithInt:7]
              forKeyPath:@"captain.no"];
    
    NSArray *arr = [NSArray arrayWithObject:realMadrid.members];
    
    NSLog(@"\ncaptionName:[%@]", [realMadrid valueForKeyPath:@"captain.name"]);
    NSLog(@"\nmembers:[%@]", [arr valueForKeyPath:@"@distinctUnionOfArrays.name"]);
    NSLog(@"\ncaptionNo:[%@]", [realMadrid valueForKeyPath:@"captain.no"]);
    
    [raul release];
    [beckham release];
    [ronaldo release];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
