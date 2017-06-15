//
//  NSObject+Enemy.h
//  OldBlacksmith
//
//  Created by Upixels_ on 17/6/14.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <Foundation/Foundation.h>

//记住扩展的文件命名、类定义的命名规则，（已有类库的类名）+（扩展类名）

@interface NSObject(Enemy)

//收到攻击的处理接口
- (void)receiveAttack:(int)attackValue;

@end
