//
//  club.m
//  testKVC
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "club.h"
#import "footballer.h"

@implementation club
@synthesize members;
@synthesize captain;

- (id)init
{
    self = [super init];
    if (self) {
        members = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)dealloc
{
    [captain release];
    [members release];
    [super dealloc];
}


@end
