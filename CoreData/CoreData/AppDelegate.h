//
//  AppDelegate.h
//  CoreData
//
//  Created by Upixels_ on 17/6/21.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

