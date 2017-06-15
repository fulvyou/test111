//
//  swordMaster.m
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "swordMaster.h"

@implementation swordMaster

- (void)takeSword
{
    //如果手中没拿莫邪，初始化之
    if (!_moXie) {
        _moXie = [[MoXieSword alloc] initWithProducerName:@"帅哥甲"
                                          producerAbility:100];
        _moXie.delegate = self;
    }
}


- (void)wanJianGuiZong:(MoXieSword*)aSword
{
    
}

- (void)yiJinJing:(MoXieSword*)aSword
{
    
}

- (void)love
{
    
}

@end
