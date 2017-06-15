//
//  sword.h
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "weapon.h"
#import <UIKit/UIKit.h>

@interface sword : weapon {
    UIColor     *_colorBody;        //剑身颜色
    NSString    *_materialBody;     //剑身材质
    
    UIColor     *_colorSheath;      //剑鞘颜色
    NSString    *_materialSheath;   //剑鞘材质
    
    UIColor     *_colorHandle;      //剑柄颜色
    NSString    *_materialHandle;   //剑柄材质
}

- (void)initSwordAttr;

@end
