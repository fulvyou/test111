//
//  ParserOperation.h
//  Thread
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSArray *);
typedef void (^ErrorBlock)(NSError *);

@interface ParserOperation : NSOperation {
    
}

//XML解析任务初始化接口
- (id)initWithURL:(NSURL *)url
completionHandler:(SuccessBlock)successBlock
        errHander:(ErrorBlock)errBlock;

@end
