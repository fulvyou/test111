//
//  sword.m
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "sword.h"

@implementation sword

- (id)initWithName:(NSString*)aWeaponName
      producerName:(NSString*)aProducerName
   producerAbility:(int)abilityValue
{
    self = [super initWithName:aWeaponName
                  producerName:aProducerName
               producerAbility:abilityValue];
    if (self)
    {
        if (aWeaponName) {
            _strName = [[NSString alloc] initWithString:aWeaponName];
        }
        else {
            _strName = DEFAULT_WEAPON_NAME;
        }
        
        
        //武器属性
        [self initSwordAttr];
    }
    
    return self;
}

- (void)initSwordAttr
{
    //对于剑属性的初始化
    _colorBody      = [[UIColor lightGrayColor] retain];
    _materialBody   = [[NSString alloc] initWithString:@"铁"];
    
    _colorSheath    = [[UIColor brownColor] retain];
    _materialSheath = [[NSString alloc] initWithString:@"皮革"];
    
    _colorHandle    = [[UIColor blackColor] retain];
    _materialHandle = [[NSString alloc] initWithString:@"木头"];
    
    _fLong          = 1.2f;
    _fWeight        = 20.0f;
}

- (int)attackValue
{
    switch (_quality) {
        case kNormalQuality:
            return 500;
        case kGoodQuality:
            return 700;
        case kExcellQuality:
            return 1100;
        default:
            return 20;
    }
}


@end
