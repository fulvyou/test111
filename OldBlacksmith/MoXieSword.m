//
//  MoXieSword.m
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "MoXieSword.h"

@implementation MoXieSword


- (id)initWithProducerName:(NSString *)aProducerName
           producerAbility:(int)abilityValue
{
    //调用初始化方法，默认设置成“莫邪”名字
    return [self initWithName:@"莫邪"
                 producerName:aProducerName
              producerAbility:abilityValue];
}

- (id)initWithName:(NSString*)aWeaponName
      producerName:(NSString*)aProducerName
   producerAbility:(int)abilityValue
{
    self = [super initWithName:aWeaponName
                  producerName:aProducerName
               producerAbility:abilityValue];
    if (self)
    {
        //武器名字不是“莫邪”，我们就强制赋值“莫邪”
        if (![_strName isEqualToString:@"莫邪"]) {
            _strName = [[NSString alloc] initWithString:@"莫邪"];
        }
        
        //默认武器属性
        _fLong      = 1.2f;
        _fWeight    = 20.0f;
    }
    
    return self;
}

//这里实现了父类中的方法，子类对象优先调用这里的函数
- (void)initSwordAttr
{
    _colorBody      = [[UIColor darkGrayColor] retain];
    _materialBody   = [[NSString alloc] initWithString:@"陨石"];
    
    //莫邪没有剑鞘
    _colorSheath    = nil;
    _materialSheath = nil;
    
    _colorHandle    = [[UIColor whiteColor] retain];
    _materialHandle = [[NSString alloc] initWithString:@"千年神木"];
    
    _fLong          = 1.5f;
    _fWeight        = 40.0f;
}

- (void)attack:(id)hitTarget
{
    //没有攻击对象
    if (!hitTarget) {
        return;
    }
    
    //    //攻击对象判定
    //    if (([(NSObject*)hitTarget respondsToSelector:@selector(receiveAttack:)])) {
    //        //对象遭受10倍的莫邪攻击
    //        [hitTarget performSelector:@selector(receiveAttack:)
    //                        withObject:[NSNumber numberWithInt:([self attackValue] * 10)]];
    //    }
    [(NSObject*)hitTarget receiveAttack:[self attackValue]];
}

- (int)attackValue
{
    //莫邪必须神匠等级的人物制作，否则发挥不出莫邪的真正实力。
    switch (_quality) {
        case kExcellQuality:
            return 100000;
        default:
            return 700;
    }
}

@end
