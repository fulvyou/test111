//
//  NSObject+Enemy.m
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "NSObject+Enemy.h"

@implementation NSObject(Enemy)

- (void)receiveAttack:(int)attackValue {
    if (attackValue > 100) {
        NSLog(@"Attack effect, I'm dead!");
    }
    else {
        NSLog(@"Defend successfully, haha!");
    }
}

@end
