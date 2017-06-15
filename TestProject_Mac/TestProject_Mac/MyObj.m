//
//  MyObj.m
//  TestProject_Mac
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "MyObj.h"

@implementation MyObj

- (void) dealloc {
    NSLog(@"%@ dealloc", [self className]);
}

@end
