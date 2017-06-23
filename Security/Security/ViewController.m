//
//  ViewController.m
//  Security
//
//  Created by Upixels_ on 17/6/22.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) addNewKeyChainItem {
    NSMutableDictionary *dictNewItem = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString *strPswd = @"helloWorld";
    OSStatus result = errSecSuccess;
    
    //Set KeyChain's Class :KVC
    [dictNewItem setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
    
    //Set KeyChain's attributes
    [dictNewItem setObject:@"testID" forKey:(id)kSecAttrGeneric];
    [dictNewItem setObject:@"testAccount" forKey:(id)kSecAttrAccount];
    [dictNewItem setObject:@"testLabel" forKey:(id)kSecAttrLabel];
    [dictNewItem setObject:@"testDesc" forKey:(id)kSecAttrDescription];
    
#if TARGET_IPHONE_SIMULATOR
    //Simulator not support
#else
    [dictNewItem setObject:@"testGroupName" forKey:kSecAttrAccessGroup];
#endif
    
    [dictNewItem setObject:[strPswd dataUsingEncoding:NSUTF8StringEncoding] forKey:(id)kSecValueData];
    result = SecItemAdd((CFDictionaryRef)dictNewItem, NULL);
    if (result != errSecSuccess) {
        NSLog(@"errorCode:[%u]", result);
    }
}

@end
