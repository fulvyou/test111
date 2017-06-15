//
//  weapon.h
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <Foundation/Foundation.h>

//宏
#define DEFAULT_WEAPON_NAME         @""
#define DEFAULT_WEAPON_PRODUCER     @""
#define DEFAULT_WEAPON_LONG         1.0   //1米
#define DEFAULT_WEAPON_WEIGHT       10.0    //10斤

typedef enum weaponQuality{
    kPoorQuality = 1,       //品质差
    kNormalQuality,         //品质一般
    kGoodQuality,           //品质好
    kExcellQuality,         //极品
}weaponQualityType;


@interface weapon : NSObject {
    //武器名字
    NSString            *_strName;
    
    //武器制作人
    NSString            *_strProducer;
    
    //武器制作时间
    NSDate              *_dateBirth;
    
    //武器品质
    weaponQualityType   _quality;
    
    //武器长度
    float               _fLong;
    //武器重量
    float               _fWeight;
}

//打造武器
- (id)initWithName:(NSString*)aWeaponName
      producerName:(NSString*)aProducerName
   producerAbility:(int)abilityValue;

//攻击
- (void)attack:(id)hitTarget;

//武器的攻击力
- (int)attackValue;

@end
