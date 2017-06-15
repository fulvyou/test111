//
//  club.h
//  testKVC
//
//  Created by Upixels_ on 17/6/15.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "footballer.h"

@interface club : NSObject

@property (nonatomic, retain) footballer        *captain;
@property (nonatomic, retain) NSMutableArray    *members;

@end
