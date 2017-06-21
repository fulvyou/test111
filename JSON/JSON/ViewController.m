//
//  ViewController.m
//  JSON
//
//  Created by Upixels_ on 17/6/20.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

const char *jsonStr = "{"\
"\"Key1\": \"Batman\","\
"\"Key2\": \"Spiderman\""\
"}";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self paserJSON];
}

- (void) paserJSON {
    NSData *data = [NSData dataWithBytes:jsonStr length:strlen(jsonStr)];
//    NSLog(@"data:%@", [NSString stringWithUTF8String:jsonStr]);
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (obj) {
        NSLog(@"[%@]", obj);
        NSLog(@"类型：[%@]", [obj class]);
    }
}



@end
