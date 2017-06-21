//
//  ViewController.m
//  Thread
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"
#include "CThread.h"

@interface ViewController () {
    NSMutableArray *_array;
    int i;
    
    NSLock *_lock;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [[NSMutableArray alloc] initWithCapacity:0];
    i = 0;
    _lock = [[NSLock alloc] init];
    
    //Begin a new thread immediately
    [NSThread detachNewThreadSelector:@selector(newThread:) toTarget:self withObject:@"Hello1"];
    
    [NSThread detachNewThreadSelector:@selector(newThread:) toTarget:self withObject:@"Hello2"];
    
    //Create a new background thread
//    [self performSelectorInBackground:@selector(newThread:) withObject:@"Hello"];
    
    //Create a C thread
//    createCThread();
    
}


- (void)newThread: (id) Object {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSLog(@"userData:%@", Object);
    while (1) {
        
        if([_lock tryLock]) {
            
            //        usleep(100000);
            [_array addObject:[NSString stringWithFormat:@"%d", ++i]];
            [_lock unlock];
        }

        //效率要低很多，不推荐
//        @synchronized (_array) {
//            [_array addObject:[NSString stringWithFormat:@"%d", ++i]];
//        }
    }
    
    [pool release];
}


@end
