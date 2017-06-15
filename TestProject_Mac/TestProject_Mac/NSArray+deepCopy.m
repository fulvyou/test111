//
//  NSMutableArray+deepCopy.m
//  TestProject_Mac
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "NSArray+deepCopy.h"

@implementation NSArray(deepCopy)

- (NSMutableArray*) mutableDeepCopy {
    //Create a new mutaleArray
    NSMutableArray *arrReturn = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id obj in self) {
        id oneCopy = nil;
        
        if ([obj respondsToSelector:@selector(mutableDeepCopy)]) {
            oneCopy = [obj mutableDeepCopy];
            NSLog(@"%p copied to %p", obj, oneCopy);
        }else if ([obj respondsToSelector:@selector(mutableCopy)]) {
            oneCopy = [obj mutableCopy];
            NSLog(@"%p copied to %p", obj, oneCopy);
        }else if ([obj conformsToProtocol: @protocol(NSCopying)]) {
            oneCopy = [obj copy];
            NSLog(@"%p copied to %p", obj, oneCopy);
        }else {
            NSLog(@"ClassName[%@] counld not be copied", [self className]);
            continue;
        }
        
        [arrReturn addObject:oneCopy];
    }
    
    
    return arrReturn;
}

@end
