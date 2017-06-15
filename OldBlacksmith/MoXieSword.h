//
//  MoXieSword.h
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "sword.h"

@protocol MoXieUser;

@interface MoXieSword : sword {
}

@property (assign) id<MoXieUser> delegate;

- (id)initWithProducerName:(NSString *)aProducerName
           producerAbility:(int)abilityValue;

@end


@protocol MoXieUser <NSObject>

@required
- (void) wanJianGuiZong: (MoXieSword*) aSword;
- (void) yiJinJing: (MoXieSword*) aSword;
- (void) love;

@optional
- (void) spaceStep:(MoXieSword*)aSword;

@end
