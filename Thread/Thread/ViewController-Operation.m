//
//  ViewController-Operation.m
//  Thread
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController-Operation.h"
#import "ParserOperation.h"

//从以下链接中获得RSS的具体链接：
//http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS?cc=CN
#define TOPGROSS_GAME_LINK  @"https://itunes.apple.com/cn/rss/topgrossingapplications/limit=50/genre=6014/xml"


@interface ViewController_Operation ()

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation ViewController_Operation
@synthesize queue = _queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    
    ParserOperation *aOperation = [[ParserOperation alloc] initWithURL:[NSURL URLWithString:TOPGROSS_GAME_LINK] completionHandler:^(NSArray *arrResult) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (arrResult && arrResult.count>0) {
                NSLog(@"arrResult:%@", arrResult);
            }
        });
    } errHander:^(NSError *error) {
        NSLog(@"error:%@", error);
    }];
    
    [_queue addOperation:aOperation];
    
}


- (void)dealloc {
    [_queue release];
    [super dealloc];
}

@end
