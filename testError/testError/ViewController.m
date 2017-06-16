//
//  ViewController.m
//  testError
//
//  Created by Upixels_ on 17/6/16.
//  Copyright © 2017年 upixels. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

void InstallSignalExceptionHandler();

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSError *userError = [[NSError alloc] initWithDomain:NSOSStatusErrorDomain code:001 userInfo:nil];
    
    NSDictionary *userInfo = [userError userInfo];
    NSString *errorDesc = nil;
    
    //检查有没有 NSUnderlyingError 可提供
    if (userInfo && [userInfo objectForKey:NSUnderlyingErrorKey]) {
        NSError *underlyingError = [userInfo objectForKey:NSUnderlyingErrorKey];
        if (underlyingError) {
            errorDesc = [underlyingError localizedDescription];
        }else {
            errorDesc = [userError localizedDescription];
        }
    } else {
        errorDesc = [userError localizedDescription];
    }
    
    [self throwException];
    
    InstallSignalExceptionHandler();
}

- (void) throwException {
    
    @try {
        if (1) {
            //抛出---》接住
            @throw [NSException exceptionWithName:@"ExceptionName" reason:@"ExceptionReason" userInfo:nil];
        }
    } @catch (NSException *exception) {
        //接住异常
        NSLog(@"异常原因1：【%@】", [exception reason]);
    }  @catch (NSException *exception) {
        //接住异常
        NSLog(@"异常原因2：【%@】", [exception reason]);
    } @finally {
        //收尾工作
        NSLog(@"感觉不错");
    }
    
}

void InstallSignalExceptionHandler() {
    signal(SIGABRT, signalErrorHandler);
    signal(SIGILL, signalErrorHandler);
    signal(SIGSEGV, signalErrorHandler);
    signal(SIGFPE, signalErrorHandler);
    signal(SIGBUS, signalErrorHandler);
    signal(SIGPIPE, signalErrorHandler);
}

void signalErrorHandler(int signal) {
    NSLog(@"信号错误 【%d】", signal);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
