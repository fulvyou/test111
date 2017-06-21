//
//  ViewController-condition.m
//  Thread
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController-condition.h"

@interface ViewController_condition () {
    NSConditionLock *_myLock;
    NSMutableArray *_array;
    int i;
}

@end

@implementation ViewController_condition

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myLock = [[NSConditionLock alloc] initWithCondition:0];
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    [NSThread detachNewThreadSelector:@selector(newThread:) toTarget:self withObject:@"Hello1"];
    
    [NSThread detachNewThreadSelector:@selector(printObject:) toTarget:self withObject:@"Hello2"];
}

- (void)newThread: (id) Object {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"userData:%@", Object);
    while (1) {
        [_myLock lock];
        [_array addObject:[NSString stringWithFormat:@"%d", ++i]];
        [_myLock unlockWithCondition:1];
    }
    
    [pool release];
}

- (void)printObject: (id) Object {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"userData:%@", Object);
    while (1) {
        [_myLock lockWhenCondition:1];
        NSLog(@"removed %ld objects!", [_array count]);
        [_array removeAllObjects];
        [_myLock unlockWithCondition:0];
    }
    
    [pool release];
}

@end
