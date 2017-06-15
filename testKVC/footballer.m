//
//  footballer.m
//  testKVC
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "footballer.h"

@implementation footballer
@synthesize name;
@synthesize no;

- (void)dealloc
{
    [name release];
    [super dealloc];
}



@end
